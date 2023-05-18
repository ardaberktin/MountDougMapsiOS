//
//  TutorialView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-03.
//

import SwiftUI

struct TutorialView: View {
    @State private var showingPopover1 = false
    @State private var showingPopover2 = false
    @State private var showingPopover3 = false
    
    var body: some View {
        VStack (spacing: 30){
            
            ZStack (alignment: .topTrailing){
                Text("First floor:\nThe arrow starts from the main entrance")
                    .frame(width: 350, height: 70, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.body)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 3)
                    )//overlay
                    .padding(.top, 40)
                
                Button {
                    showingPopover1 = true
                } label:{
                    Image(systemName: "questionmark.circle.fill")
                        .padding(.trailing, 10)
                        .padding(.top, 50)
                        .pinchToZoom()
                       
                }.popover(isPresented: $showingPopover1) {
                    Text("First Floor")
                        .font(.headline)
                        .padding(.top, 30)
                        .padding(.bottom, 50)
                    
                    Text("Main Doors:")
                        .frame(maxWidth: .infinity,maxHeight:30, alignment: .leading)
                        .padding(.leading, 20)
                    
                    Image("MainEntrance")
                        .resizable()
                        .scaledToFit()
                        .pinchToZoom()
                    
                    Spacer()
                }//button

            }//ZStack 1st
            
            
            ZStack (alignment: .topTrailing){
                Text("Second floor:\nThe arrow stars from the stairs next to the breezeway")
                    .frame(width: 350, height: 70, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.body)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 3)
                    )//overlay
                
                Button {
                    showingPopover2 = true
                } label:{
                    Image(systemName: "questionmark.circle.fill")
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                       
                }.popover(isPresented: $showingPopover2) {
                        
                    Text("Second Floor")
                        .font(.headline)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    
                        Image("MiddleStairs1")
                            .resizable()
                            .scaledToFit()
                            .pinchToZoom()
                        
                        Image("MiddleStairs2")
                            .resizable()
                            .scaledToFit()
                            .pinchToZoom()
                    
                    Spacer()
                }
            }//ZStack 2nd
            
            ZStack (alignment: .topTrailing){
                Text("Favourites:\nClick on the heart button in any room to add it to your favourites")
                    .frame(width: 350, height: 70, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.body)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 3)
                    )//overlay
                
                Button {
                    showingPopover3 = true
                } label:{
                    Image(systemName: "questionmark.circle.fill")
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                       
                }.popover(isPresented: $showingPopover3) {
                        
                    Text("Add to Favourites")
                        .font(.headline)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    
                        Image("FavouritesButton")
                            .resizable()
                            .scaledToFit()
                            .border(.black)
                            .pinchToZoom()
                        
                    
                    Spacer()
                }
            }//ZStack 3rd
    
            Spacer()
           
        }//VStack
        .navigationTitle("Tutorial")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,for: .navigationBar)
        //.toolbarBackground(.visible, for: .navigationBar)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
