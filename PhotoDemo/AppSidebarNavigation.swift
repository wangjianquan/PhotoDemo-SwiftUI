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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
