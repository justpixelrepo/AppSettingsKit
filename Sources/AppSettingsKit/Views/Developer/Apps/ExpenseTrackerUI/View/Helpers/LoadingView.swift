//
//  LoadingView.swift
//  MyExpenses (iOS)
//
//  Created by Balaji on 04/03/23.
//

import SwiftUI

struct LoadingView: View {
    @Binding var show: Bool
    var body: some View {
        ZStack {
            if show {
                ZStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                    ProgressView()
                        .frame(width: 50, height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.background)
                        }
                }
                .transition(.opacity)
                .ignoresSafeArea()
            }
        }
        .animation(.snappy, value: show)
    }
}
