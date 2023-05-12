//
//  FavouritesView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-11.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favs: Favourites
    
    var body: some View {
        NavigationStack{
           ZStack (alignment: .top){
                    List{
                        Section(""){
                            ForEach($favs.rooms, id: \.self, editActions: .move) { $room in
                                HStack {
                                    NavigationLink {
                                        MapView(number: room)
                                    } label: {
                                        Text("Room \(room)")
                                    }
                                
                                }
                            }//ForEach
                            .onDelete(perform: deleteItems)
                            
                        }//Section 1
                        
                    }//List
                    .navigationTitle("Favourites")
                    .background(.purple)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(.purple,for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbar{
                        EditButton()
                           .disabled(favs.rooms.isEmpty)
                        
                    }
                    
                    if favs.rooms.isEmpty{
                        Text("No Favourites").padding()
                    }
               
            }//ZStack
            //.padding()
            
        }//Navigation Stack
        

    }//Body
    
    func deleteItems(at offsets: IndexSet){
        favs.rooms.remove(atOffsets: offsets)
        favs.saveRooms()
    }
}//View Struct

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environmentObject(Favourites())
            
    }
}
