//
//  Home.swift
//  CardAnimation
//
//  Created by Balaji on 05/05/23.
//

import SwiftUI
import Charts

struct WalletCardView: View {
    var size: CGSize
    var model: WalletModel
    @Namespace private var animation
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Your Balance")
                        .font(.caption)
                        .foregroundColor(.black)
                    
                    Text("$2950.89")
                        .font(.title2.bold())
                }
            }
            .padding([.horizontal, .top], 15)
            
            /// Cards View
            /// Only used to Fetch The Frame Bounds and it's Position in the Screen
            CardsView()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    BottomScrollContent()
                }
                .padding(.top, 30)
                .padding([.horizontal, .bottom], 15)
            }
            .frame(maxWidth: .infinity)
            .background {
                /// Custom Corner
                CustomCorner(corners: [.topLeft, .topRight], radius: 30)
                    .fill(.white)
                    .ignoresSafeArea()
                /// Adding Shadow
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: -5)
            }
            .padding(.top, 20)
        }
        .background {
            Rectangle()
                .fill(.black.opacity(0.05))
                .ignoresSafeArea()
        }
        .overlay(content: {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
                .overlay(alignment: .top, content: {
                    /// Top Navigation
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    model.expandCards = false
                                }
                            }
                        
                        Spacer()
                        
                        
                    }
                    .padding(15)
                })
                .opacity(model.expandCards ? 1 : 0)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Text(model.title)
                            .font(.title2.bold())
                    }
                }
        })
        .overlay(content: {
            if let _ = model.selectedCard, model.showDetailView {
                WalletCardDetailView(size: size, model: model)
                /// For more Why I'm using this Technique, Check out my Animation hack Video
                /// Link in the Description
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
            }
        })
        .overlayPreferenceValue(CardRectKey.self) { preferences in
            if let cardPreference = preferences["CardRect"] {
                /// Geometry Reader is Used to Extract CGRect From the Anchor
                GeometryReader { proxy in
                    let cardRect = proxy[cardPreference]
                    
                    CardContent()
                        .frame(width: cardRect.width, height: model.expandCards ? nil : cardRect.height)
                    /// Position it Using Offset
                        .offset(x: cardRect.minX, y: cardRect.minY)
                }
                .allowsHitTesting(!model.showDetailView)
            }
        }
    }
    
    /// Card Content
    @ViewBuilder
    func CardContent() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            /// Expanding Cards when Tapped
            VStack(spacing: 0) {
                /// To Show First Card on Top
                /// Simply Reverse the Array
                ForEach(cards.reversed()) { card in
                    let index = CGFloat(indexOf(card))
                    let reversedIndex = CGFloat(cards.count - 1) - index
                    /// Displaying First Three cards on the Stack
                    let displayingStackIndex = min(index, 2)
                    let displayScale = (displayingStackIndex / CGFloat(cards.count)) * 0.15
                    
                    ZStack {
                        if model.selectedCard?.id == card.id && model.showDetailView {
                            /// Empty View
                            Rectangle()
                                .foregroundColor(.clear)
                        } else {
                            CardView(model: model)
                            /// Applying 3D Rotation
                                .rotation3DEffect(.init(degrees: model.expandCards ? (model.showDetailView ? 0 : -15) : 0), axis: (x: 1, y: 0, z: 0), anchor: .top)
                            /// Hero Effect ID
                                .matchedGeometryEffect(id: card.id, in: animation)
                            /// Hiding Cards once when the Detail Card Displayed
                                .offset(y: model.showDetailView ? size.height : 0)
                                .onTapGesture {
                                    if model.expandCards {
                                        /// Expading Selected Card
                                        model.selectedCard = card
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            model.showDetailView = true
                                            model.title = "Transactions"
                                            
                                        }
                                    
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                model.showDetailContent = true
                                            }
                                        }
                                    } else {

                                        /// Expanding Cards
                                        withAnimation(.easeInOut(duration: 0.35)) {
                                            model.expandCards = true
                                            model.title = "All Cards"
                                            
                                        }
                                    }
                                }
                        }
                    }
                    .frame(height: 200)
                    /// Applying Scaling
                    .scaleEffect(1 - (model.expandCards ? 0 : displayScale))
                    .offset(y: model.expandCards ? 0 : (displayingStackIndex * -15))
                    /// Stacking one on Another
                    .offset(y: reversedIndex * -200)
                    .padding(.top, model.expandCards ? (reversedIndex == 0 ? 0 : 80) : 0)
                }
            }
            /// Appling Remaining Height as Padding
            .padding(.top, 45)
            /// Reducing Size
            .padding(.bottom, CGFloat(cards.count - 1) * -200)
        }
        /// Disabling Scroll
        .scrollDisabled(!model.expandCards)
    }
    
    /// Card Index
    func indexOf(_ card: Card) -> Int {
        return cards.firstIndex {
            card.id == $0.id
        } ?? 0
    }
    
    /// Cards View
    /// Only used to Fetch The Frame Bounds and it's Position in the Screen
    @ViewBuilder
    func CardsView() -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 245)
        /// Fetching it's Current Frame Position VIA Anchor Preference
            .anchorPreference(key: CardRectKey.self, value: .bounds) { anchor in
                return ["CardRect": anchor]
            }
    }
    
    /// Bottom Scroll View Content
    @ViewBuilder
    func BottomScrollContent() -> some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Instant Transfer")
                    .font(.title3.bold())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(1...6, id: \.self) { index in
                            Image("Pic \(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                }
                /// Removing Horizontal Padding, And Adding it inside the ScrollView
                .padding(.horizontal, -15)
            }
            
            /// Swift Charts
            /// Displaying Last Four Month Income/Expenses From our Overview Model
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Overview")
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    Text("Last 4 Months")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Chart(sampleData) { overview in
                    ForEach(overview.value) { data in
                        BarMark(x: .value("Month", data.month, unit: .month), y: .value(overview.type.rawValue, data.amount))
                    }
                    .foregroundStyle(by: .value("Type", overview.type.rawValue))
                    /// Positioning Bar Marks
                    .position(by: .value("Type", overview.type.rawValue))
                }
                /// Custom Chart Foreground Colors
                /// We can also Apply Gradient Directly from here
                .chartForegroundStyleScale(range: [Color.green.gradient, Color.red.gradient])
                .frame(height: 200)
                .padding(.top, 25)
            }
            .padding(.top, 15)
        }
    }
}


