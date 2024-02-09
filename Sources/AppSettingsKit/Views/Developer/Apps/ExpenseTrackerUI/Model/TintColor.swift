//
//  TintColor.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 11/12/23.
//

import SwiftUI

/// Custom Tint Colors For Transaction Row
struct TintColor: Identifiable {
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "Orange", value: .orange),
    .init(color: "Cyan", value: .cyan),
    .init(color: "Indigo", value: .indigo),
]
