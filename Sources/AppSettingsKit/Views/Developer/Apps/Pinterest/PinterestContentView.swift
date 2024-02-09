import SwiftUI
import Combine

struct PinterestContentView: View {
    @State private var imageLoader = ImageLoaderService()
    @State private var leftColumnImages: [UIImage] = []
    @State private var rightColumnImages: [UIImage] = []
    @State private var selectedImage: UIImage?
    
    let imageCornerRadius: CGFloat = 10
    let imageSpacing: CGFloat = 8
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: imageSpacing) {
                        HStack(alignment: .top, spacing: imageSpacing) {
                            VStack(spacing: imageSpacing) {
                                ForEach(leftColumnImages, id: \.self) { img in
                                    Image(uiImage: img)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (UIScreen.main.bounds.width / 2) - (imageSpacing + imageSpacing / 2))
                                        .cornerRadius(imageCornerRadius)
                                        .clipped()
                                        .onTapGesture {
                                            self.selectedImage = img
                                        }
                                }
                            }
                            VStack(spacing: imageSpacing) {
                                ForEach(rightColumnImages, id: \.self) { img in
                                    Image(uiImage: img)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (UIScreen.main.bounds.width / 2) - (imageSpacing + imageSpacing / 2))
                                        .cornerRadius(imageCornerRadius)
                                        .clipped()
                                        .onTapGesture {
                                            self.selectedImage = img
                                        }
                                }
                            }
                        }
                    }
                }
                
                if selectedImage != nil {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            self.selectedImage = nil
                        }
                    
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .cornerRadius(imageCornerRadius)
                        .onTapGesture {
                            self.selectedImage = nil
                        }
                }
            }
            .navigationBarTitle("Gallery", displayMode: .inline)
            .onAppear {
                imageLoader.loadImages { leftImages, rightImages in
                    self.leftColumnImages = leftImages
                    self.rightColumnImages = rightImages
                }
            }
        }
    }
}

#Preview {
    PinterestContentView()
}

class ImageLoaderService {
    private var cancellables = Set<AnyCancellable>()
    
    func loadImages(completion: @escaping ([UIImage], [UIImage]) -> Void) {
        let urls = (1...10).map { _ in URL(string: "https://source.unsplash.com/random/300x\((Int.random(in: 300...600)))")! }
        
        let publishers = urls.map { URLSession.shared.dataTaskPublisher(for: $0).map { UIImage(data: $0.data) }.replaceError(with: nil) }
        
        Publishers.MergeMany(publishers)
            .collect()
            .sink(receiveValue: { images in
                let nonNilImages = images.compactMap { $0 }
                let half = nonNilImages.count / 2
                let leftImages = Array(nonNilImages[..<half])
                let rightImages = Array(nonNilImages[half...])
                completion(leftImages, rightImages)
            })
            .store(in: &cancellables)
    }
}
