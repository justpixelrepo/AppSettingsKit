//
//  CustomShareSheet.swift
//  CoreDataToJSON
//
//  Created by Balaji on 03/03/23.
//

import SwiftUI

/// Custom Share Sheet Using UIKit Activity Controller
struct CustomShareSheet: UIViewControllerRepresentable {
    @Binding var url: URL
    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [url], applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
