//
//  ContentView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI

struct ClassroomsView: View {
    @State var visibleItem: Set<Int> = Set()
   // @State var an: Bool = false

    var body: some View {
        NavigationStack {
            //ScrollViewReader { proxy in
            VStack{
                
                ScrollViewReader { proxy in
                        
                   // if visibleItem.contains(1){
                        Text("Please click on the room you would like to find.")
                            .padding(.leading, 21)
                            .padding(.top, 10)
                            .frame(maxWidth: .infinity,maxHeight:30, alignment: .leading)
                            .foregroundColor(.white)
                            .backgroundStyle(.black)
                  //}
                        
                        ZStack (alignment: .bottomTrailing)
                        {
                            //ScrollView{
                            List {
                                
                                NavigationLink("Map of the First Floor", value: 1)
                                    .padding(6)
                                    .id(1)
                                    .onAppear(){
                                        visibleItem.insert(1)
                                        
                                    }.onDisappear(){
                                        visibleItem.remove(1)
                                        
                                    }
                                
                                //                                .frame(width: 380,height: 45,alignment: .center) //for custom list using ScrollVIew                                                                                   //and LazyVStack
                                //                                .border(.red)
                                
                                
                                NavigationLink("Map of the Second Floor", value: 2)
                                    .padding(6)
                                    .id(2)
                                    .onAppear(){
                                        visibleItem.insert(2)
                                    }.onDisappear(){
                                        visibleItem.remove(2)
                                    }
                                
                                
                                ForEach(101..<124) { index in
                                    if index != 115 {
                                        NavigationLink("Room: \(index)", value: index)
                                            .padding(6)
                                            .id(index)
                                            .onAppear(){
                                                visibleItem.insert(index)
                                            }.onDisappear(){
                                                visibleItem.remove(index)
                                            }
                                    }
                                }
                                
                                ForEach(201..<228) { index in
                                    if !(index == 204 ||  index == 213 || index == 215 || index == 224){
                                        NavigationLink("Room: \(index)", value: index)
                                            .padding(6)
                                            .id(index)
                                            .onAppear(){
                                                visibleItem.insert(index)
                                            }.onDisappear(){
                                                visibleItem.remove(index)
                                            }
                                    }
                                }
                            }//list
                            .listRowBackground(Color.purple)
                            .background(Color.white) // Set the overall background color of the list
                            
                            // if visibleItem.contains(1){
//                                 Text("Please click on the room you would like to find.")
//                                .background(.purple)
//                                .foregroundColor(.white)
                             //}
                            
                          
                            
                            if visibleItem.contains(1){
                                
                                Button {
                                    withAnimation(){
                                        proxy.scrollTo(227)
                                    }
                                }label: {
                                    Image(systemName: "chevron.down")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12.0 , height: 12)
                                    .padding(30)
                                    .background(.black.opacity(0.5))
                                    .frame(width: 40.0 , height: 40)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    
                                    
                                    
                                }//label for button
                                .padding(5)
                                   

                            }//if
                            
                            if !visibleItem.contains(1){
                                Button {
                                    withAnimation(){
                                        proxy.scrollTo(1)
                                    }
                                }label: {
                                    Image(systemName: "chevron.up")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 12.0 , height: 12)
                                        .padding(30)
                                        .background(.black.opacity(0.5))
                                        .frame(width: 40.0 , height: 40)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    
                                }//label for button
                                .padding(5)
                                
                                
                            }// if visible item for chevron.down
                        }//ZStack
                        .navigationDestination(for: Int.self) { num in
                            MapView(number: num)
                        }

                }//ScrollViewReader
                //Spacer() //adds a bottom notch to the list
                    
                
            }//VStack
            .navigationTitle("MountDoug Maps")
            .background(.purple)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.purple,for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink{
                        InfoView()
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("About")
                                .offset(x: -5)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        TutorialView()
                    } label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .offset(x: 5)
                            Text("Tutorial")
                            
                        }
                    }
                }
            }
                
        }//NavigationStack
        .padding(0)
    }//body
    
}//struct view
        
    
struct ClassroomsView_Previews: PreviewProvider {
    static var previews: some View {
        ClassroomsView()
            .environmentObject(Favourites())
    }
}// struct preview



