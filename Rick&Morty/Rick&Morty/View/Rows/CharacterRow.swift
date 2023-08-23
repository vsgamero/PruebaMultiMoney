//
//  CharacterRow.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 21/8/23.
//

import SwiftUI
import Rickandmortyapi

struct CharacterRow: View {
    //let character: CharacterSmall
    let image:String
    let name: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string:image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(25)
                case .failure:
                    Image("temp")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(25)
                @unknown default:
                    Image("temp")
                        .resizable()
                        .frame(maxWidth: 200, maxHeight: 200)
                        .cornerRadius(25)
                }
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title3)
                    .foregroundColor(.accentColor)
            }
        }
    }
}
