
import SwiftUI

@Observable
public class WalletModel {
    /// Animation Properties
    var title = "All Cards"
   var expandCards: Bool = false
    var card: Card  = .init(cardColor: .black, cardName: "Apple Card", cardBalance: "$4000")
    /// Detail Card Properties
    var showDetailView: Bool = false
    var showDetailContent: Bool = false
    var selectedCard: Card?
}
