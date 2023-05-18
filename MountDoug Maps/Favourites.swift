//
//  Favourites.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-11.
//

import SwiftUI

class Favourites: ObservableObject{
    @Published var rooms = [Int]()
    
    init() {
            loadRooms()
        }
    

    
    var total: Int{
        return rooms.count
    }
    
    func add(item: Int){
        
        if !rooms.contains(item){
            rooms.append(item)
            saveRooms()
        }
        
    }
    
    func remove(item: Int){
        if let index = rooms.firstIndex(of: item){
            rooms.remove(at: index)
            saveRooms()
        }
    }
    
    func contains(item: Int) -> Bool{
        return rooms.contains(item)
    }
    
   func saveRooms() {
            UserDefaults.standard.set(rooms, forKey: "FavouriteRooms")
        }
        
    private func loadRooms() {
        if let savedRooms = UserDefaults.standard.array(forKey: "FavouriteRooms") as? [Int] {
                rooms = savedRooms
        }
    }

}
