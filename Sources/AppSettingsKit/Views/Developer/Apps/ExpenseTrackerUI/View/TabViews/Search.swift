//
//  Search.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 11/12/23.
//

import SwiftUI
import Combine

struct Search: View {
    /// View Properties
    @State private var searchText: String = ""
    @State private var filterText: String = ""
    @State private var selectedCategory: Category? = nil
    @State private var selectedTransaction: Transaction?
    let searchPublisher = PassthroughSubject<String, Never>()
    @Namespace private var animation
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 12, pinnedViews: [.sectionHeaders]) {
                    Section {
                        FilterTransactionsView(category: selectedCategory, searchText: filterText) { transactions in
                            ForEach(transactions) { transaction in
                                TransactionCardView(transaction: transaction, showsCategory: true)
                                    .onTapGesture {
                                        selectedTransaction = transaction
                                    }
                            }
                        }
                    } header: {
                        SegmentedPicker()
                    }
                }
                .padding([.horizontal, .bottom], 15)
            }
            .navigationDestination(item: $selectedTransaction) { transaction in
                TransactionView(editTransaction: transaction)
            }
            .overlay(content: {
                ContentUnavailableView("Search Transactions", systemImage: "magnifyingglass")
                    .opacity(filterText.isEmpty ? 1 : 0)
            })
            .onChange(of: searchText, { oldValue, newValue in
                if newValue.isEmpty {
                    filterText = ""
                }
                searchPublisher.send(newValue)
            })
            .onReceive(searchPublisher.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main), perform: { text in
                filterText = text
            })
            .searchable(text: $searchText)
            .navigationTitle("Search")
            .background(.gray.opacity(0.15))
        }
    }
    
    @ViewBuilder
    func SegmentedPicker() -> some View {
        HStack(spacing: 0) {
            Text("Both")
                .font(.callout)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background {
                    if selectedCategory == nil {
                        Capsule()
                            .fill(.background)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
                .contentShape(.rect)
                .onTapGesture {
                    selectedCategory = nil
                }
            
            ForEach(Category.allCases, id: \.rawValue) { category in
                Text(category.rawValue)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background {
                        if selectedCategory == category {
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.rect)
                    .onTapGesture {
                        selectedCategory = category
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
        .animation(.snappy, value: selectedCategory)
        .padding(.vertical, 5)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .padding(.horizontal, -15)
        }
    }
}

#Preview {
    Search()
}
