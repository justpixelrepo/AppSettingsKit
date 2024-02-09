//
//  NewExpenseView.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 12/12/23.
//

import SwiftUI
import WidgetKit
import UserNotifications

struct TransactionView: View {
    /// Env Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var editTransaction: Transaction?
    /// Notification Properties
    @AppStorage("enableNotifications") private var enableNotifications: Bool = false
    @AppStorage("notificationAccess") private var isNotificationAccessGiven: NotificationState = .notDetermined
    @State private var addRemainder: Bool = false
    @State private var remainderID: String = ""
    /// View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    /// Random Tint
    @State var tint: TintColor = tints.randomElement()!
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                
                /// Preview Transaction Card View
                TransactionCardView(transaction: .init(
                    title: title.isEmpty ? "Title" : title,
                    remarks: remarks.isEmpty ? "Remarks" : remarks,
                    amount: amount,
                    dateAdded: dateAdded,
                    category: category,
                    tintColor: tint
                ))
                
                CustomSection("Title", "Magic Keyboard", value: $title)
                
                CustomSection("Remarks", "Apple Product!", value: $remarks)
                
                /// Amount & Category Check Box
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Amount & Category")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    HStack(spacing: 15) {
                        HStack(spacing: 4) {
                            Text(currencySymbol)
                                .font(.callout.bold())
                            
                            TextField("0.0", value: $amount, formatter: numberFormatter)
                                .keyboardType(.decimalPad)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in: .rect(cornerRadius: 10))
                        .frame(maxWidth: 130)
                        
                        /// Custom Check Box
                        CategoryCheckBox()
                    }
                })
                
                /// Notification View
                if enableNotifications && isNotificationAccessGiven == .approved {
                    NotificationToggle()
                }
                
                /// Date Picker
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)
                    
                    DatePicker("", selection: $dateAdded, displayedComponents: addRemainder ? [.date, .hourAndMinute] : [.date])
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in: .rect(cornerRadius: 10))
                })
            }
            .padding(15)
        }
        .navigationTitle("\(editTransaction == nil ? "Add" : "Edit") Transaction")
        .background(.gray.opacity(0.15))
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save", action: save)
            }
        })
        .onAppear(perform: {
            if let editTransaction {
                /// Load All Existing Data from the Transaction
                title = editTransaction.title
                remarks = editTransaction.remarks
                dateAdded = editTransaction.dateAdded
                if let category = editTransaction.rawCategory {
                    self.category = category
                }
                amount = editTransaction.amount
                if let tint = editTransaction.tint {
                    self.tint = tint
                }
                addRemainder = editTransaction.enableRemainder
                remainderID = editTransaction.remainderID
            }
        })
    }
    
    /// Saving Data
    func save() {
        Task {
            if addRemainder {
                /// Removing Previously Added Remainder
                if !remainderID.isEmpty {
                    removeRemainder()
                }
                
                /// Adding New Notification Remainder
                let request = setUpRemainder()
                if let _ = try? await UNUserNotificationCenter.current().add(request.0) {
                    remainderID = request.1
                }
            } else {
                /// Removing Added Notification Remainder
                removeRemainder()
            }
            
            await MainActor.run {
                /// Saving Item to SwiftData
                if editTransaction != nil {
                    editTransaction?.title = title
                    editTransaction?.remarks = remarks
                    editTransaction?.amount = amount
                    editTransaction?.category = category.rawValue
                    editTransaction?.dateAdded = dateAdded
                    editTransaction?.enableRemainder = addRemainder
                    editTransaction?.remainderID = remainderID
                } else {
                    let transaction = Transaction(title: title, remarks: remarks, amount: amount, dateAdded: dateAdded, category: category, tintColor: tint)
                    transaction.enableRemainder = addRemainder
                    transaction.remainderID = remainderID
                    context.insert(transaction)
                }
                
                /// Dismissing View
                dismiss()
                /// Updating Widgets
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
    }
    
    @ViewBuilder
    func CustomSection(_ title: String, _ hint: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            TextField(hint, text: value)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
        })
    }
    
    /// Custom CheckBox
    @ViewBuilder
    func CategoryCheckBox() -> some View {
        HStack(spacing: 10) {
            ForEach(Category.allCases, id: \.rawValue) { category in
                HStack(spacing: 5) {
                    ZStack {
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(appTint)
                        
                        if self.category == category {
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(appTint)
                        }
                    }
                    
                    Text(category.rawValue)
                        .font(.caption)
                }
                .contentShape(.rect)
                .onTapGesture {
                    self.category = category
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .hSpacing(.leading)
        .background(.background, in: .rect(cornerRadius: 10))
    }
    
    /// Notification Toggle
    @ViewBuilder
    func NotificationToggle() -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text("Remainder")
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            Toggle("Enable Monthly Remainder", isOn: $addRemainder)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
                .onChange(of: addRemainder) { oldValue, newValue in
                    
                }
        })
    }
    
    /// Remainder Notification
    func setUpRemainder() -> (UNNotificationRequest, String) {
        /// Notification Content
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = remarks
        /// Notification Identifier
        let notificationID = UUID().uuidString
        /// Notification Trigger
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day, .hour, .minute], from: dateAdded)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        /// Notification Request
        let notificationRequest = UNNotificationRequest(identifier: notificationID, content: notificationContent, trigger: trigger)
        return (notificationRequest, notificationID)
    }
    
    /// Removes Added Remainder Notification
    func removeRemainder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [remainderID])
        remainderID = ""
    }
    
    /// Number Formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}

#Preview {
    NavigationStack {
        TransactionView()
    }
}
