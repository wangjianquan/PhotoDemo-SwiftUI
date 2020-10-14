//
//  Navigation.swift
//  PhotoDemo
//
//  Created by MacBook Pro on 2020/10/14.
//

import SwiftUI

struct Navigation: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            AppTabNavigtionView()
        }else{
            AppSidebarNavigation()
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
