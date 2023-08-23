// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CharacterSmall: Rickandmortyapi.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CharacterSmall on Character { __typename id name image }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Character }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Rickandmortyapi.ID?.self),
    .field("name", String?.self),
    .field("image", String?.self),
  ] }

  /// The id of the character.
  public var id: Rickandmortyapi.ID? { __data["id"] }
  /// The name of the character.
  public var name: String? { __data["name"] }
  /// Link to the character's image.
  /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
  public var image: String? { __data["image"] }
}
