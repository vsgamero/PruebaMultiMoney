//
//  Network.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 21/8/23.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
