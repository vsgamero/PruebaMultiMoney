// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Rickandmortyapi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Rickandmortyapi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Rickandmortyapi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Rickandmortyapi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return Rickandmortyapi.Objects.Query
    case "Characters": return Rickandmortyapi.Objects.Characters
    case "Info": return Rickandmortyapi.Objects.Info
    case "Character": return Rickandmortyapi.Objects.Character
    case "Episode": return Rickandmortyapi.Objects.Episode
    case "Location": return Rickandmortyapi.Objects.Location
    case "Episodes": return Rickandmortyapi.Objects.Episodes
    case "Locations": return Rickandmortyapi.Objects.Locations
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
