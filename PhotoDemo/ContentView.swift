//
//  ContentView.swift
//  PhotoDemo
//
//  Created by WJQ on 2020/10/13.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var randomImages = UnsplashData()

    var body: some View {
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
            
        }).navigationBarTitle("random images")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
