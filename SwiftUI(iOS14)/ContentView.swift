//
//  ContentView.swift
//  SwiftUI(iOS14)
//
//  Created by MacBook Pro on 2020/9/15.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @ObservedObject var randomImages = UnsplashData()
    class ImageSaver: NSObject {
        
        func writeToPhotoAlbum(image: UIImage) {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
        }
        
        @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            print("Save finished!")
        }
    }

    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//            Button("Select Image") {
//                self.showingImagePicker = true
//            }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage, content: {
//                ImagePicker(image: self.$inputImage)
//            })
//        }
        ScrollView(content: {
            LazyVStack(content: {
                ForEach(randomImages.photoArray, id: \.id) { photo in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
//                        .placeholder(Image(systemName: "photo"))
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity) // Activity Indicator
                        .aspectRatio(contentMode: .fill)
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .frame(width: UIScreen.main.bounds.width-50, height: 200, alignment: .center)
                        .cornerRadius(15)

                    Text("image name\(photo.id)")
                        
                }
            })
        }).navigationTitle("random images")
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
        
        
//        let beginImage = CIImage(image: inputImage)
//        let context = CIContext()
        ///1.
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        
        ///2.
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 10
        
        ///3.
////        let currentFilter = CIFilter.crystallize()
////        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
////        currentFilter.radius = 200
////        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
////        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
////        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
////        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
//
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            let uiImage = UIImage(cgImage: cgimg)
//            image = Image(uiImage: uiImage)
//        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
