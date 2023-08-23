//
//  EpisodioRow.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 19/8/23.
//

import SwiftUI

struct EpisodioRow: View {
    let episodie: String
    let name: String
    let date: String
    
    var body: some View {
        VStack{
            HStack {
                Label(episodie, systemImage: "info")
                    .fontWeight(.semibold)
                Spacer()
            }
            HStack {
                Label(name, systemImage: "info")
                    .fontWeight(.semibold)
                Spacer()
            }
            HStack {
                Label(date, systemImage: "calendar")
                    .fontWeight(.semibold)
                Spacer()
            }
        }
        
    }
}

