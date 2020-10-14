//
//  AppTabNavigtionView.swift
//  PhotoDemo
//
//  Created by MacBook Pro on 2020/10/14.
//

import SwiftUI

struct AppTabNavigtionView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    ContentView()
                        .tabItem {
                            Label("List", systemImage: "list.dash")
                                .accessibility(label: Text("List layout"))
                        }.tag(0)
                    ImageGridView()
                        .tabItem {
                            Label("Grid", systemImage: "rectangle.3.offgrid")
                                .accessibility(label: Text("Grid layout"))
                        }.tag(1)
                })
        
    }
}

struct AppTabNavigtionView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigtionView()
    }
}
