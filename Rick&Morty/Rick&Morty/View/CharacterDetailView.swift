//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 19/8/23.
//

import SwiftUI
import Rickandmortyapi
import Apollo

struct CharacterDetailView: View {
    @State private var showAlert = false;
    @ObservedObject private var viewModel = CharactersViewModel()
    @Environment(\.dismiss) var dismiss
    
    let id: ID
    let isFav: Bool
    var character: CharacterFull? {
        viewModel.detail
    }
    var colorButtonFav: Color {
        if isFav{
            return .red
        }else{
            return .green
        }
    }
    
    var body: some View {
        
        List{
            Section(header: Text("")) {
                //AVATAR
                HStack {
                    Spacer()
                    if let image = character?.image{
                        AsyncImage(url: URL(string:image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200, maxHeight: 200)
                                    .cornerRadius(100)
                            case .failure:
                                Image("temp")
                                    .resizable()
                                    .frame(maxWidth: 200, maxHeight: 200)
                                    .cornerRadius(100)
                            @unknown default:
                                Image("temp")
                                    .resizable()
                                    .frame(maxWidth: 200, maxHeight: 200)
                                    .cornerRadius(100)
                            }
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                //FAVORITO
                HStack {
                    Spacer()
                    Button(action: {
                        
                        if isFav{
                            viewModel.deleteFavorito(id: (character?.id)!)
                        }else{
                            viewModel.addFavorito(character: character!)
                        }
                        showAlert = true
                    }) {
                        HStack {
                            Image("favorito")
                            Text(viewModel.getTitleButton(isFav: isFav))
                        }
                    }.alert("Rick&Morty", isPresented: $showAlert){
                        Button {
                            viewModel.dismisView(isFav: isFav)
                        } label: {
                            Text("Aceptar")
                        }
                    }message: {
                        Text(viewModel.msg)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                    .font(.headline.weight(.semibold))
                    .background(colorButtonFav)
                    .foregroundColor(.white)
                    .controlSize(.large)
                    .cornerRadius(20)
                    Spacer()
                }
                
            }
            
            infoSection
            episodiesSection
        }
        .onAppear {
            viewModel.getSpecificCharacter(identifier: id)
        }
        .onReceive(viewModel.viewDismissalModePublisher) { shouldDismissView in
            if shouldDismissView {
                dismiss()
            }
        }
        .navigationBarItems(trailing: Text(viewModel.detail?.name ?? "Loading...").font(.title2.weight(.bold)))
    }
    
    private var infoSection: some View {
        Section(header: Text("GENERALES"),
                content: {
            InfoRowView(label: "Estado",
                        icon: "waveform.path.ecg.rectangle",
                        value: character?.status ?? "loading...")
            InfoRowView(label: "Especie",
                        icon: "hare",
                        value: character?.species ?? "loading...")
            InfoRowView(label: "Género",
                        icon: "eyes",
                        value: character?.gender ?? "loading...")
            InfoRowView(label: "Origen",
                        icon: "paperplane",
                        value: character?.origin?.name ?? "loading...")
            InfoRowView(label: "Ubicación",
                        icon: "map",
                        value: character?.location?.name ?? "loading...")
            
        })
        .redacted(reason: character == nil ? .placeholder : [])
    }
    
    private var episodiesSection: some View {
        Section(header: Text("EPISODIOS"),
                content: {
            //EPISODIOS
            ForEach(viewModel.detail?.episode ?? [CharacterFull.Episode](), id: \.!.episode) { episody in
                EpisodioRow(episodie: (episody?.episode)!, name: (episody?.name)!, date: (episody?.air_date)!)
            }
        })
        .redacted(reason: character == nil ? .placeholder : [])
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(id: "0", isFav: false)
    }
}
