//
//  Model.swift
//  SwiftUI(iOS14)
//
//  Created by MacBook Pro on 2020/10/13.
//

import Foundation

struct Photo: Identifiable, Decodable {
    var id: String
    var urls: [String : String]
    var alt_description: String?
}

class UnsplashData: ObservableObject {
    @Published var photoArray: [Photo] = []
    init() {
        loadData()
    }
    func loadData() {
        let AccessKey = "IncNKlFL0cdnUGAC8JhaJemzse_CexfH8R-Vr2g3Ca4"
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(AccessKey)"
       
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
            guard let data = data else {
                print("dataTask error",error ?? "nil")
                return
            }
            
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data)
                print("\(json)")
                for photo in json {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
