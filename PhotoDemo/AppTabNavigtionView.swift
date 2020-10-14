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
                    ContentView().tabItem {
                        Image(systemName: "list.dash")
                        Text("list")
                    }.tag(0)
                    ImageGridView().tabItem {
                        Image(systemName: "list.dash")
                        Text("Grid")
                    }.tag(1)
                })
        
    }
}

struct AppTabNavigtionView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigtionView()
    }
}
