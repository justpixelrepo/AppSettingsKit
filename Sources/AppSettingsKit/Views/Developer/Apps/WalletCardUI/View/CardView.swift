import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0.6...0.9),
            green: .random(in: 0.6...0.9),
            blue: .random(in: 0.6...0.9)
        )
    }
}

struct CardView: View {
    var model: WalletModel
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.random)
                    .overlay(alignment: .top) {
                        VStack {
                            HStack {
                                Image("Sim")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 55, height: 55)
                                
                                Spacer(minLength: 0)
                                
                                Image(systemName: "wave.3.right")
                                    .font(.largeTitle.bold())
                            }
                            
                            
                            Text(model.card.cardBalance)
                                .font(.title2.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(y: 5)
                        }
                        .padding(20)
                        .foregroundColor(.black)
                    }
                
                Rectangle()
                    .fill(.black)
                    .frame(height: size.height / 3.5)
                    /// Card Details
                    .overlay {
                        HStack {
                            Text(model.card.cardName)
                                .fontWeight(.semibold)
                            
                            Spacer(minLength: 0)
                            
                            Image("Visa")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                        .foregroundColor(.white)
                        .padding(15)
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
    }
}
