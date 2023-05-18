//
//  MapView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-01.
//

import SwiftUI

struct MapView: View {
    let number: Int
    
    var navText: String {
            if number == 1 {
                return "Map of the First Floor"
            } else if number == 2 {
                return "Map of the Second Floor"
            } else {
                return "Room: \(number)"
            }
        }
    

    var body: some View {
            
            VStack(alignment: .trailing){
                Image(String(number))
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .pinchToZoom()
                
                TappableButton(number: number).padding()
                
            }
            .navigationBarTitle(navText)
            .navigationBarTitleDisplayMode(.inline)
            //.foregroundColor(.white)
            //.background(.black)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.purple,for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

    }
        
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(number: 106)
            .environmentObject(Favourites())
    }
}
