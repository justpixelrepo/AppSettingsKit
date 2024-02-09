//
//  Constants.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 10/12/23.
//

import SwiftUI

@Observable
class Constants {
    static let shared = Constants()
    
    var appTint: String = UserDefaults.standard.string(forKey: "appTint") ?? "Red"
    
    var tintColor: Color {
        return tints.first { $0.color == appTint }?.value ?? .red
    }
}
