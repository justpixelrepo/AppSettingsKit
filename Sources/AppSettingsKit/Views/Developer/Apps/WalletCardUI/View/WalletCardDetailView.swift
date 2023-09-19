/// Detail View
import SwiftUI
struct WalletCardDetailView: View {
    var size: CGSize
    var model: WalletModel
    @Namespace private var animation
    var body: some View {
        VStack(spacing: 0) {
            /// NavBar
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        model.showDetailContent = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            model.showDetailView = false
                        }
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3.bold())
                }
                
                Spacer()
                
            }
            .foregroundColor(.black)
            .padding(15)
            .opacity(model.showDetailContent ? 1 : 0)
            
            /// Card View
            CardView(model: model)
                .rotation3DEffect(.init(degrees: model.showDetailContent ? 0 : -15), axis: (x: 1, y: 0, z: 0), anchor: .top)
                .matchedGeometryEffect(id: model.card.id, in: animation)
                .frame(height: 200)
                .padding([.horizontal, .top], 15)
                /// Pushing View to the Top
                .zIndex(1000)
            
            /// Sample Expenses View
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(expenses) { expense in
                        HStack(spacing: 12) {
                            Image(expense.productIcon)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(expense.product)
                                    .fontWeight(.bold)
                                
                                Text(expense.spendType)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer(minLength: 0)
                            
                            Text(expense.amountSpent)
                                .fontWeight(.semibold)
                        }
                        
                        Divider()
                    }
                }
                .padding(.top, 25)
                .padding([.horizontal, .bottom], 15)
            }
            .background {
                CustomCorner(corners: [.topLeft, .topRight], radius: 30)
                    .fill(.white)
                    .padding(.top, -120)
                    .ignoresSafeArea()
            }
            /// Sliding Effect
            .offset(y: !model.showDetailContent ? (size.height * 0.7) : 0)
            .opacity(model.showDetailContent ? 1 : 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background {
            Rectangle()
                .fill(Color("DetailBG"))
                .ignoresSafeArea()
                .opacity(model.showDetailContent ? 1 : 0)
        }
    }
}

