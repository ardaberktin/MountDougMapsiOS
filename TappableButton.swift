//
//  TappableButton.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-11.
//

import SwiftUI

struct TappableButton: View {
    @EnvironmentObject var favs: Favourites
    @State var number: Int
    
    var isTapped: Bool {
        favs.contains(item: number)
    }
    
    var body: some View {
            
            Button{
                if isTapped {
                    favs.remove(item: number)
                } else {
                    favs.add(item: number)
                }
            
            }label: {
                Image(systemName: isTapped ? "suit.heart.fill" : "heart")
                    .padding()
                
            }//Button
            //.buttonStyle(.borderedProminent)
            // .foregroundColor(Color.accentColor)
    }
}
    

struct TappableButton_Previews: PreviewProvider {
    static var previews: some View {
        TappableButton(number: 106)
            .environmentObject(Favourites())
    }
}
