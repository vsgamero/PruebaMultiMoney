// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetSearchQuery: GraphQLQuery {
  public static let operationName: String = "GetSearch"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetSearch($name: String!) { characters(page: 1, filter: {name: $name}) { __typename info { __typename count } results { __typename ...CharacterSmall } } locations(page: 1, filter: {name: $name}) { __typename info { __typename count } results { __typename ...LocationDetail } } episodes(page: 1, filter: {name: $name}) { __typename info { __typename count } results { __typename ...EpisodeDetail } } }"#,
      fragments: [CharacterSmall.self, LocationDetail.self, EpisodeDetail.self]
    ))

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var __variables: Variables? { ["name": name] }

  public struct Data: Rickandmortyapi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("characters", Characters?.self, arguments: [
        "page": 1,
        "filter": ["name": .variable("name")]
      ]),
      .field("locations", Locations?.self, arguments: [
        "page": 1,
        "filter": ["name": .variable("name")]
      ]),
      .field("episodes", Episodes?.self, arguments: [
        "page": 1,
        "filter": ["name": .variable("name")]
      ]),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["characters"] }
    /// Get the list of all locations
    public var locations: Locations? { __data["locations"] }
    /// Get the list of all episodes
    public var episodes: Episodes? { __data["episodes"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: Rickandmortyapi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Characters }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("info", Info?.self),
        .field("results", [Result?]?.self),
      ] }

      public var info: Info? { __data["info"] }
      public var results: [Result?]? { __data["results"] }

      /// Characters.Info
      ///
      /// Parent Type: `Info`
      public struct Info: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Info }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("count", Int?.self),
        ] }

        /// The length of the response.
        public var count: Int? { __data["count"] }
      }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CharacterSmall.self),
        ] }

        /// The id of the character.
        public var id: Rickandmortyapi.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var characterSmall: CharacterSmall { _toFragment() }
        }
      }
    }

    /// Locations
    ///
    /// Parent Type: `Locations`
    public struct Locations: Rickandmortyapi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Locations }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("info", Info?.self),
        .field("results", [Result?]?.self),
      ] }

      public var info: Info? { __data["info"] }
      public var results: [Result?]? { __data["results"] }

      /// Locations.Info
      ///
      /// Parent Type: `Info`
      public struct Info: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Info }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("count", Int?.self),
        ] }

        /// The length of the response.
        public var count: Int? { __data["count"] }
      }

      /// Locations.Result
      ///
      /// Parent Type: `Location`
      public struct Result: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Location }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(LocationDetail.self),
        ] }

        /// The id of the location.
        public var id: Rickandmortyapi.ID? { __data["id"] }
        /// The name of the location.
        public var name: String? { __data["name"] }
        /// The type of the location.
        public var type: String? { __data["type"] }
        /// The dimension in which the location is located.
        public var dimension: String? { __data["dimension"] }
        /// List of characters who have been last seen in the location.
        public var residents: [LocationDetail.Resident?] { __data["residents"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var locationDetail: LocationDetail { _toFragment() }
        }
      }
    }

    /// Episodes
    ///
    /// Parent Type: `Episodes`
    public struct Episodes: Rickandmortyapi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Episodes }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("info", Info?.self),
        .field("results", [Result?]?.self),
      ] }

      public var info: Info? { __data["info"] }
      public var results: [Result?]? { __data["results"] }

      /// Episodes.Info
      ///
      /// Parent Type: `Info`
      public struct Info: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Info }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("count", Int?.self),
        ] }

        /// The length of the response.
        public var count: Int? { __data["count"] }
      }

      /// Episodes.Result
      ///
      /// Parent Type: `Episode`
      public struct Result: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Episode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(EpisodeDetail.self),
        ] }

        /// The id of the episode.
        public var id: Rickandmortyapi.ID? { __data["id"] }
        /// The name of the episode.
        public var name: String? { __data["name"] }
        /// Time at which the episode was created in the database.
        public var created: String? { __data["created"] }
        /// The air date of the episode.
        public var air_date: String? { __data["air_date"] }
        /// The code of the episode.
        public var episode: String? { __data["episode"] }
        /// List of characters who have been seen in the episode.
        public var characters: [EpisodeDetail.Character?] { __data["characters"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var episodeDetail: EpisodeDetail { _toFragment() }
        }
      }
    }
  }
}
