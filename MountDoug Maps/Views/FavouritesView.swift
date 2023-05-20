//
//  FavouritesView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-11.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favs: Favourites
    @State var isEditing = false
    @State var selectedRooms = Set<Int>()
    
    
    var body: some View {
        NavigationStack{
           ZStack (alignment: .top){
                    List(selection: isEditing ? $selectedRooms : .constant([])){
                        Section(header: Text("")) {
                            ForEach(favs.rooms, id: \.self) { room in
                                HStack {
                                    NavigationLink {
                                        MapView(number: room)
                                    } label: {
                                        Text(roomText(number:room))
                                    }
                                
                                }
    
                            }//ForEach
                            .onDelete(perform: deleteItems)
                            .onMove(perform: moveItems)
                           
                            
                        }//Section 1
                        
                    }//List
                    .navigationTitle("Favourites")
                    .background(.purple)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(.purple,for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .navigationBarItems(
                        leading: deleteSelectedButton(),
                        trailing: editButton()
                    )
                    .environment(\.editMode, .constant(self.isEditing ? EditMode.active: EditMode.inactive))
                    //.animation(Animation.spring(), value: isEditing) //doesn't work
                    .id(UUID())
                    
                    
                    if favs.rooms.isEmpty{
                        Text("No Favourites")
                            .padding()
                            .font(.title.bold())
                    }
               
            }//ZStack
           .onChange(of: favs.rooms) { _ in
               selectedRooms.removeAll() // Clear selectedRooms when favs.rooms changes
           }
            //.padding()
            
        }//Navigation Stack
        

    }//Body
    
    func deleteItems(at offsets: IndexSet){
        favs.rooms.remove(atOffsets: offsets)
        selectedRooms.removeAll() // Clear the selectedRooms set
        favs.saveRooms()
    }
    
    func roomText(number: Int) -> String{
            if number == 1 {
                return "Map of the First Floor"
            } else if number == 2 {
                return "Map of the Second Floor"
            } else {
                return "Room: \(number)"
            }
        }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        favs.rooms.move(fromOffsets: source, toOffset: destination)
        favs.saveRooms()
    }
    
    @ViewBuilder
    func deleteSelectedButton() -> some View {
        if selectedRooms.isEmpty || !isEditing{
            EmptyView()
        } else {
            Button(action: deleteSelectedRooms) {
                Text("Delete")
            }
        }
    }
    
    @ViewBuilder
    func editButton() -> some View {
        if favs.rooms.isEmpty && !isEditing {
            EmptyView()
        } else {
            Button {
                withAnimation {
                    isEditing.toggle()
                }
             
                selectedRooms.removeAll()
            } label: {
                if self.isEditing{
                    Text("Done")
                }else{
                    Text("Edit")
                }
            }//button
        }//else
        
       
        
    }//editButton
        
    func deleteSelectedRooms() {
        favs.rooms.removeAll(where: { selectedRooms.contains($0) })
        selectedRooms.removeAll()
        favs.saveRooms()
        
        if favs.rooms.isEmpty && isEditing{
            isEditing = false
        }
    }
    
}//View Struct

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environmentObject(Favourites())
    }
}
