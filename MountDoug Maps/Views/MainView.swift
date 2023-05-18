//
//  ContentView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI
import UIKit

struct MainView: View {
    
    var body: some View {
            
        TabView {
                   
            ClassroomsView()
                .tabItem {
                    Label("Maps", systemImage: "house")

                }
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                    
                }
            
        }//tabview
        .onAppear {
            
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.clear.opacity(0))
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        
    }//body
}//MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Favourites())
    }
}// struct preview
