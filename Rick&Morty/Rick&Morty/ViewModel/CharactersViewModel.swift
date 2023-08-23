//
//  CharactersViewModel.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 19/8/23.
//

import Foundation
import SwiftUI
import Apollo
import Rickandmortyapi
import Combine

class CharactersViewModel: ObservableObject {
    
    @Published public var characters: [CharacterSmall]?
    @Published public var detail: CharacterFull?
    @Published public var fav: [Favorito]?
    @Published public var msg: String = ""
    
    var viewDismissalModePublisher = PassthroughSubject<Bool, Never>()
    private var shouldDismissView = false {
            didSet {
                viewDismissalModePublisher.send(shouldDismissView)
            }
        }
    
    public var currentPage = 1 {
        didSet {
            getCharacters()
        }
    }
    
    public var shouldDisplayNextPage: Bool {
        if characters?.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    public private(set) var totalPage: Int?
    public private(set) var totalCharacters: Int?
    
    func getCharacters() {
        let fetchedPage = currentPage
        Network.shared.apollo.fetch(query: GetCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: currentPage))) { [weak self] result in
            switch result {
            case .success(let result):
                if fetchedPage > 1 {
                    if let newCharacters = result.data?.characters?.results?.compactMap({ $0?.fragments.characterSmall }) {
                        self?.characters?.append(contentsOf: newCharacters)
                    }
                } else {
                    self?.characters = result.data?.characters?.results?.compactMap{ $0?.fragments.characterSmall }
                }
                self?.totalPage = result.data?.characters?.info?.pages
                self?.totalCharacters = result.data?.characters?.info?.count
        
            case .failure(let error):
                print("GraphQL query error: \(error)")
            }
        }
    }
    
    func getSpecificCharacter(identifier: ID) {
        Network.shared.apollo.fetch(query: GetCharacterQuery(id: identifier)) { [weak self] result in
            switch result {
            case .success(let result):
                self?.detail = result.data?.character?.fragments.characterFull
            case .failure(let error):
                print("GraphQL query error: \(error)")
            }
        }
    }
    
    func dismisView(isFav: Bool){
        if isFav{
            self.shouldDismissView = true
        }else{
            self.shouldDismissView = false
        }
        
    }
    
    func getFavoritos() {
        self.fav = GlobalArrayManager.shared.getArray()
    }
    
    func getMessage(isFav:Bool){
        if isFav{
            msg = "Personaje borrado de favoritos"
        }else{
            msg = "Personaje agregado a favoritos"
        }
    }
    
    func getTitleButton(isFav:Bool) -> String{
        var output = ""
        if isFav{
            output = "Borrar de Favoritos   "
        }else{
            output = "Agregar a Favoritos   "
        }
        return output
    }
    
    func colorButtonFav(isFav: Bool) -> UIColor{
        if isFav{
            return .red
        }else{
            return .green
        }
    }
    
    func addFavorito(character: CharacterFull){
        if !GlobalArrayManager.shared.existItem(id: (character.id)!){
            GlobalArrayManager.shared.addDataInArray(data: Favorito(id: (character.id)!, name: (character.name)!, image: (character.image)!))
            getMessage(isFav: false)
        }else{
            msg = "Ya has agregado este personaje a tus favoritos"
        }
    }
    
    func deleteFavorito(id: ID){
        if !GlobalArrayManager.shared.existItem(id: id){
            msg = "Ya has borrado este personaje de tus favoritos"
        }else{
            GlobalArrayManager.shared.deleteItemByID(id: id)
            getMessage(isFav: true)
        }
        
    }
    
}
