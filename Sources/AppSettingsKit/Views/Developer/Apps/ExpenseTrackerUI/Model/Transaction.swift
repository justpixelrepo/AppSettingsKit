//
//  Transaction.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 11/12/23.
//

import SwiftUI
import SwiftData

@Model
class Transaction: Codable {
    /// Properties
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    var enableRemainder: Bool = false
    var remainderID: String = ""
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    /// Conforming Codable Protocol
    enum CodingKeys: CodingKey {
        case title
        case remarks
        case amount
        case dateAdded
        case category
        case tintColor
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        remarks = try container.decode(String.self, forKey: .remarks)
        amount = try container.decode(Double.self, forKey: .amount)
        dateAdded = try container.decode(Date.self, forKey: .dateAdded)
        category = try container.decode(String.self, forKey: .category)
        tintColor = try container.decode(String.self, forKey: .tintColor)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(remarks, forKey: .remarks)
        try container.encode(amount, forKey: .amount)
        try container.encode(dateAdded, forKey: .dateAdded)
        try container.encode(category, forKey: .category)
        try container.encode(tintColor, forKey: .tintColor)
    }
    
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? Constants.shared.tintColor
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first(where: { $0.color == tintColor })
    }
    
    @Transient
    var rawCategory: Category? {
        return Category.allCases.first(where: { category == $0.rawValue })
    }
}
