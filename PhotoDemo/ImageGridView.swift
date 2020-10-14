//
//  ImageGridView.swift
//  PhotoDemo
//
//  Created by MacBook Pro on 2020/10/14.
//

import SwiftUI
import SDWebImageSwiftUI


struct ImageGridView: View {
    @ObservedObject var randomImages = UnsplashData()
    let columns = [
        GridItem(spacing: 15,alignment: .center),
        GridItem(spacing: 15,alignment: .center),
        GridItem(spacing: 15,alignment: .center)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            LazyVGrid(columns: columns,spacing:15, content: /*@START_MENU_TOKEN@*/{
                ForEach(randomImages.photoArray, id: \.id) { (photo)  in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
//                        .placeholder(Image(systemName: "photo"))
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .frame(width: (UIScreen.main.bounds.size.width-15-2*15-15)/3, height: (UIScreen.main.bounds.size.width-15-2*15-15)/3)
                        .aspectRatio(contentMode: .fill)

                        .cornerRadius(5)
                        .clipped()
                    Text(photo.id).font(.footnote)
                }
                
            }/*@END_MENU_TOKEN@*/)
        })
        .padding(15)
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
