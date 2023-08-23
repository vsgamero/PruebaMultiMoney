// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetEpisodesQuery: GraphQLQuery {
  public static let operationName: String = "GetEpisodes"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetEpisodes($page: Int) { episodes(page: $page) { __typename info { __typename count pages } results { __typename ...EpisodeDetail } } }"#,
      fragments: [EpisodeDetail.self]
    ))

  public var page: GraphQLNullable<Int>

  public init(page: GraphQLNullable<Int>) {
    self.page = page
  }

  public var __variables: Variables? { ["page": page] }

  public struct Data: Rickandmortyapi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Rickandmortyapi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("episodes", Episodes?.self, arguments: ["page": .variable("page")]),
    ] }

    /// Get the list of all episodes
    public var episodes: Episodes? { __data["episodes"] }

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
          .field("pages", Int?.self),
        ] }

        /// The length of the response.
        public var count: Int? { __data["count"] }
        /// The amount of pages.
        public var pages: Int? { __data["pages"] }
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
