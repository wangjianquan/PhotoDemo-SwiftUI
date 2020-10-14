//
//  AppSidebarNavigation.swift
//  PhotoDemo
//
//  Created by MacBook Pro on 2020/10/14.
//

import SwiftUI

struct AppSidebarNavigation: View {
    enum NavitationItem {
        case list
        case grid
    }
    
    @State private var selection: Set<NavitationItem> = [.list]
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: ContentView()) {
                Label("List", systemImage: "list.bullet")
                    .accessibility(label: Text("List layout"))
                    .tag(NavitationItem.list)
            }
            NavigationLink(destination: ImageGridView()) {
                Label("Grid", systemImage: "rectangle.3.offgrid")
                    .accessibility(label: Text("Grid layout"))
                    .tag(NavitationItem.grid)
            }
        }
        .navigationTitle("Content Options")
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        NavigationView {
            sidebar
            Text("Select Content Style")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
