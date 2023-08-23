//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 19/8/23.
//

import SwiftUI
import Rickandmortyapi

struct CharactersView: View {
    let favoritos = [
        "Roy Kent",
        "Richard Montlaur",
    ]
    
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView{
            TabView {
                VStack {
                    List{
                        ForEach(viewModel.characters ?? [CharacterSmall](), id: \.id){ character in
                            NavigationLink {
                                CharacterDetailView(id: character.id!, isFav: false)
                            } label: {
                                CharacterRow(image: character.image!, name: character.name!)
                            }

                        }
                        if viewModel.shouldDisplayNextPage {
                            nextPageView
                        }
                    }
                    .onAppear {
                        viewModel.getCharacters()
                    }
                    .listStyle(.automatic)
                    .font(.headline)
                }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Personajes")
                }
                VStack {
                    List{
                        ForEach(viewModel.fav ?? [Favorito](), id: \.id){ fav in
                            NavigationLink {
                                CharacterDetailView(id: fav.id, isFav: true)
                            } label: {
                                CharacterRow(image: fav.image, name: fav.name)
                            }

                        }
                    }
                    .onAppear {
                        viewModel.getFavoritos()
                    }
                    .listStyle(.automatic)
                }
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Favoritos")
                }
                
            }
            .accentColor(Color("splashColorBackground"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("rick_banner")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: 100.0)
                        .imageScale(.large)
                }
            }
        }
        //.padding()
        .background(.white)
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                ProgressView()
                Text("Loading next page...")
            }
            Spacer()
        }
        .onAppear(perform: {
            viewModel.currentPage += 1
        })
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
