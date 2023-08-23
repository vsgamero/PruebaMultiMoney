//
//  GlobalArrayManager.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 21/8/23.
//

import Foundation
import Rickandmortyapi


class GlobalArrayManager{
    static let shared = GlobalArrayManager()
    var favoritos : [Favorito] = []
    private init(){}

    func getArray()->[Favorito]{
        return favoritos
    }

    func addDataInArray(data : Favorito){
        favoritos.append(data)
    }
    
    func deleteItemByID(id: ID){
        var index = 0
        for fav in favoritos{
            if fav.id == id{
                break
            }
            index += 1
        }
        
        if !(index >= favoritos.count){
            favoritos.remove(at: index)
        }
        
    }
    
    func existItem(id: ID) -> Bool{
        var exist = false
        for fav in favoritos{
            if fav.id == id{
                exist = true
                break
            }
        }
        return exist
    }
}
