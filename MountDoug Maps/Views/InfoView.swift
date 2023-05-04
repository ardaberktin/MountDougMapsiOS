//
//  InfoView.swift
//  MountDoug Maps
//
//  Created by Arda Berktin on 2023-05-03.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            List{
                HStack {
                    Spacer()
                    Text("Made by Arda Berktin")
                    Spacer()
                }
            }//list
        }//VStack
    }//body
}//view

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
