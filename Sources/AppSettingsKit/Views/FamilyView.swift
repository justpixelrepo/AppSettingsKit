import SwiftUI

public extension Kit {
    struct FamilyView: View {
        private let family: Family
        
        public init(
            family: Family
        ) {
            self.family = family
        }
        
        public var body: some View {
            HStack {
                
                
                HStack(alignment: .bottom, spacing: -16) {
                    ForEach((1...4), id: \.self) { _ in
                        
                        Image(systemName: "person.crop.circle.fill")
                            .symbolVariant(.circle)
                            .font(.title2)
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.blue, .blue)
                            .imageScale(.large)
                            .overlay(Circle().stroke(Color.black,lineWidth: 1.5).frame(width: 27))
                           
                        
                        
                    }
                    
                }
                
                
                Text("Family")
            }
        }
    }
}

struct FamilyViewPreview: PreviewProvider {
    static var previews: some View {
        Kit.FamilyView(family: .init())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
