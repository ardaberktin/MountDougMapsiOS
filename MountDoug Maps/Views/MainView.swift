//
//  ContentView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            ClassroomsView()
                .tabItem {
                    Label("Maps", systemImage: "house")
                }
            
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }//tabview
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Favourites())
    }
}// struct preview
