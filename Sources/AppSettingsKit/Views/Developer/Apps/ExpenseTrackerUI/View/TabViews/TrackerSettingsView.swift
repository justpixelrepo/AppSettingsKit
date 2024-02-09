//
//  Settings.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 11/12/23.
//

import SwiftUI
import WidgetKit
import SwiftData
import UserNotifications

struct TrackerSettingsView: View {
    /// User Properties
    @AppStorage("userName") private var userName: String = ""
    /// App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    @Environment(\.modelContext) private var context
    /// App Theme Properties
    @State private var changeTheme: Bool = false
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    /// Notification Properties
    @AppStorage("enableNotifications") private var enableNotifications: Bool = false
    @AppStorage("notificationAccess") private var isNotificationAccessGiven: NotificationState = .notDetermined
    @Environment(\.openURL) private var openURL
    @Environment(\.scenePhase) private var scenePhase
    /// Import & Export Properties
    @State private var presentFilePicker: Bool = false
    @State private var presentShareSheet: Bool = false
    @State private var shareURL: URL = URL(string: "https://apple.com")!
    @State private var isLoading: Bool = false
    /// Alert Properties
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    var body: some View {
        NavigationStack {
            List {
                Section("User Name") {
                    TextField("iJustine", text: $userName)
                }
                
                Section("App Lock") {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled {
                        Toggle("Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
                
                Section("App Tint") {
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            ForEach(tints) { tint in
                                Circle()
                                    .fill(tint.value.gradient)
                                    .frame(width: 25, height: 25)
                                    .overlay {
                                        if Constants.shared.appTint == tint.color {
                                            Circle()
                                                .stroke(.primary, lineWidth: 1)
                                                .padding(-2)
                                        }
                                    }
                                    .contentShape(.rect)
                                    .onTapGesture {
                                        UserDefaults.standard.setValue(tint.color, forKey: "appTint")
                                        Constants.shared.appTint = tint.color
                                    }
                            }
                        }
                        .padding(5)
                    }
                }
                
                Section("Appearance") {
                    HStack(spacing: 0) {
                        Button("Change Theme") {
                            changeTheme.toggle()
                        }
                        
                        Spacer()
                        
                        Text(userTheme.rawValue)
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                }
                
                Section {
                    Toggle(isOn: $enableNotifications) {
                        Text("Enable Notifications")
                    }
                    .disabled(isNotificationAccessGiven == .denied)
                } header: {
                    Text("Notifications")
                } footer: {
                    switch isNotificationAccessGiven {
                    case .notDetermined:
                        Text("Remainds about Future Transactions!")
                    case .approved:
                        Text(enableNotifications ? "Turning off will cancel all the future notifications!" : "Remainds about Future Transactions!")
                    case .denied:
                        Button("Please visit settings to provide the Notification Access!") {
                            if let settingURL = URL(string: UIApplication.openSettingsURLString) {
                                openURL(settingURL)
                            }
                        }
                        .font(.caption2)
                    }
                }
                
                Section("Import & Export") {
                    Button("Import") {
                        presentFilePicker.toggle()
                    }
                    
                    Button("Export", action: exportTransactions)
                }
            }
            .navigationTitle("Settings")
        }
        /// For Exporting Expneses as JSON File
        .sheet(isPresented: $presentShareSheet) {
            deleteTempFile()
        } content: {
            CustomShareSheet(url: $shareURL)
        }
        /// File Importer (For Selecting JSON File From Files App)
        .fileImporter(isPresented: $presentFilePicker, allowedContentTypes: [.json]) { result in
            switch result {
            case .success(let url):
                if url.startAccessingSecurityScopedResource() {
                    importJSON(url)
                } else {
                    alertMessage = "Failed to access the File due to security reasons!"
                    showAlert.toggle()
                }
            case .failure(let failure):
                alertMessage = failure.localizedDescription
                showAlert.toggle()
            }
        }
        /// Alert View
        .alert(alertMessage, isPresented: $showAlert) {  }
        /// Loading View (Displaying when any Heavy task is happening in the background)
        .overlay {
            LoadingView(show: $isLoading)
        }
        /// Theme Picker
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
                /// Since Max Height is 410
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
        .toolbar(isLoading ? .hidden : .visible, for: .tabBar)
        .onChange(of: enableNotifications, initial: true) { _, newValue in
            if newValue {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { status, _ in
                    enableNotifications = status
                }
            } else {
                removeAllPendingNotifications()
            }
        }
    }
    
    /// Importing JSON File and Adding to SwiftData
    func importJSON(_ url: URL) {
        isLoading = true
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1) {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let transactions = try decoder.decode([Transaction].self, from: jsonData)
                
                DispatchQueue.main.async {
                    for transaction in transactions {
                        context.insert(transaction)
                    }
                    isLoading = false
                    alertMessage = "File Imported Successfully!"
                    showAlert.toggle()
                    /// Updating Widgets
                    WidgetCenter.shared.reloadAllTimelines()
                }
            } catch {
                /// DO ACTION
                displayAlert(error)
            }
        }
    }
    
    /// Exporting SwiftData to JSON File
    func exportTransactions() {
        isLoading = true
        Task.detached(priority: .high) {
            try? await Task.sleep(for: .seconds(1))
            /// Step 1:
            /// Fetching All Transactions from SwiftData
            if let transactions = try? context.fetch(.init(sortBy: [
                SortDescriptor(\Transaction.dateAdded, order: .reverse)
            ])) {
                /// Step 2:
                /// Converting Items to JSON String File
                let jsonData = try JSONEncoder().encode(transactions)
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    /// Saving into Temporary Document And Sharing it Via ShareSheet
                    let tempURL = URL(filePath: NSTemporaryDirectory())
                    let pathURL = tempURL.appending(component: "My Expenses\(Date().formatted(date: .complete, time: .omitted)).json")
                    try jsonString.write(to: pathURL, atomically: true, encoding: .utf8)
                    /// Saved Successfully
                    await MainActor.run {
                        shareURL = pathURL
                        presentShareSheet.toggle()
                        isLoading = false
                    }
                }
            } else {
                await MainActor.run {
                    isLoading = false
                    alertMessage = "Error on Exporting"
                    showAlert.toggle()
                }
            }
        }
    }
    
    func deleteTempFile() {
        do {
            try FileManager.default.removeItem(at: shareURL)
            print("Removed Temp JSON File")
        } catch {
            displayAlert(error)
        }
    }
    
    /// Displays alert from background thread
    func displayAlert(_ error: Error) {
        DispatchQueue.main.async {
            alertMessage = error.localizedDescription
            showAlert.toggle()
            isLoading = false
        }
    }
    
    /// Remove All Pending Notifications
    func removeAllPendingNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

#Preview {
    TrackerContentView()
}
