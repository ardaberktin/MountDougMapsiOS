//
//  MountDoug_MapsApp.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI

@main
struct MountDoug_MapsApp: App {
    @StateObject var favs = Favourites()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(favs)
        }
    }
}
