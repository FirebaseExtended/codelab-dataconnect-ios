import Foundation

import FirebaseCore
import FirebaseDataConnect




















// MARK: Common Enums

public enum OrderDirection: String, Codable, Sendable {
  case ASC = "ASC"
  case DESC = "DESC"
  }

// End enum definitions









public class UpsertUserMutation{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "UpsertUser"

  public typealias Ref = MutationRef<UpsertUserMutation.Data,UpsertUserMutation.Variables>

  public struct Variables: OperationVariable {
  
        
        public var
username: String


    
    
    
    public init (
        
username: String

        
        ) {
        self.username = username
        

        
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
      
        return lhs.username == rhs.username
              
    }

    
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(username)
  
}

    enum CodingKeys: String, CodingKey {
      
      case username
      
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let codecHelper = CodecHelper<CodingKeys>()
      
      
      try codecHelper.encode(username, forKey: .username, container: &container)
      
      
    }

  }

  public struct Data: Decodable, Sendable {



public var 
user_upsert: UserKey

  }

  public func ref(
        
username: String

        ) -> MutationRef<UpsertUserMutation.Data,UpsertUserMutation.Variables>  {
        var variables = UpsertUserMutation.Variables(username:username)
        

        let ref = dataConnect.mutation(name: "UpsertUser", variables: variables, resultsDataType:UpsertUserMutation.Data.self)
        return ref as MutationRef<UpsertUserMutation.Data,UpsertUserMutation.Variables>
   }

  @MainActor
   public func execute(
        
username: String

        ) async throws -> OperationResult<UpsertUserMutation.Data> {
        var variables = UpsertUserMutation.Variables(username:username)
        
        
        let ref = dataConnect.mutation(name: "UpsertUser", variables: variables, resultsDataType:UpsertUserMutation.Data.self)
        
        return try await ref.execute()
        
   }
}






public class AddFavoritedMovieMutation{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "AddFavoritedMovie"

  public typealias Ref = MutationRef<AddFavoritedMovieMutation.Data,AddFavoritedMovieMutation.Variables>

  public struct Variables: OperationVariable {
  
        
        public var
movieId: UUID


    
    
    
    public init (
        
movieId: UUID

        
        ) {
        self.movieId = movieId
        

        
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
      
        return lhs.movieId == rhs.movieId
              
    }

    
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(movieId)
  
}

    enum CodingKeys: String, CodingKey {
      
      case movieId
      
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let codecHelper = CodecHelper<CodingKeys>()
      
      
      try codecHelper.encode(movieId, forKey: .movieId, container: &container)
      
      
    }

  }

  public struct Data: Decodable, Sendable {



public var 
favorite_movie_upsert: FavoriteMovieKey

  }

  public func ref(
        
movieId: UUID

        ) -> MutationRef<AddFavoritedMovieMutation.Data,AddFavoritedMovieMutation.Variables>  {
        var variables = AddFavoritedMovieMutation.Variables(movieId:movieId)
        

        let ref = dataConnect.mutation(name: "AddFavoritedMovie", variables: variables, resultsDataType:AddFavoritedMovieMutation.Data.self)
        return ref as MutationRef<AddFavoritedMovieMutation.Data,AddFavoritedMovieMutation.Variables>
   }

  @MainActor
   public func execute(
        
movieId: UUID

        ) async throws -> OperationResult<AddFavoritedMovieMutation.Data> {
        var variables = AddFavoritedMovieMutation.Variables(movieId:movieId)
        
        
        let ref = dataConnect.mutation(name: "AddFavoritedMovie", variables: variables, resultsDataType:AddFavoritedMovieMutation.Data.self)
        
        return try await ref.execute()
        
   }
}






public class DeleteFavoritedMovieMutation{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "DeleteFavoritedMovie"

  public typealias Ref = MutationRef<DeleteFavoritedMovieMutation.Data,DeleteFavoritedMovieMutation.Variables>

  public struct Variables: OperationVariable {
  
        
        public var
movieId: UUID


    
    
    
    public init (
        
movieId: UUID

        
        ) {
        self.movieId = movieId
        

        
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
      
        return lhs.movieId == rhs.movieId
              
    }

    
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(movieId)
  
}

    enum CodingKeys: String, CodingKey {
      
      case movieId
      
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let codecHelper = CodecHelper<CodingKeys>()
      
      
      try codecHelper.encode(movieId, forKey: .movieId, container: &container)
      
      
    }

  }

  public struct Data: Decodable, Sendable {



public var 
favorite_movie_delete: FavoriteMovieKey?

  }

  public func ref(
        
movieId: UUID

        ) -> MutationRef<DeleteFavoritedMovieMutation.Data,DeleteFavoritedMovieMutation.Variables>  {
        var variables = DeleteFavoritedMovieMutation.Variables(movieId:movieId)
        

        let ref = dataConnect.mutation(name: "DeleteFavoritedMovie", variables: variables, resultsDataType:DeleteFavoritedMovieMutation.Data.self)
        return ref as MutationRef<DeleteFavoritedMovieMutation.Data,DeleteFavoritedMovieMutation.Variables>
   }

  @MainActor
   public func execute(
        
movieId: UUID

        ) async throws -> OperationResult<DeleteFavoritedMovieMutation.Data> {
        var variables = DeleteFavoritedMovieMutation.Variables(movieId:movieId)
        
        
        let ref = dataConnect.mutation(name: "DeleteFavoritedMovie", variables: variables, resultsDataType:DeleteFavoritedMovieMutation.Data.self)
        
        return try await ref.execute()
        
   }
}






public class ListMoviesQuery{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "ListMovies"

  public typealias Ref = QueryRefObservation<ListMoviesQuery.Data,ListMoviesQuery.Variables>

  public struct Variables: OperationVariable {
  
        @OptionalVariable
        public var
orderByRating: OrderDirection?

  
        @OptionalVariable
        public var
orderByReleaseYear: OrderDirection?

  
        @OptionalVariable
        public var
limit: Int?


    
    
    
    public init (
        
        
        
        _ optionalVars: ((inout Variables)->())? = nil
        ) {
        

        
        if let optionalVars {
            optionalVars(&self)
        }
        
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
      
        return lhs.orderByRating == rhs.orderByRating && 
              lhs.orderByReleaseYear == rhs.orderByReleaseYear && 
              lhs.limit == rhs.limit
              
    }

    
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(orderByRating)
  
  hasher.combine(orderByReleaseYear)
  
  hasher.combine(limit)
  
}

    enum CodingKeys: String, CodingKey {
      
      case orderByRating
      
      case orderByReleaseYear
      
      case limit
      
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let codecHelper = CodecHelper<CodingKeys>()
      
      if $orderByRating.isSet { 
      try codecHelper.encode(orderByRating, forKey: .orderByRating, container: &container)
      }
      
      if $orderByReleaseYear.isSet { 
      try codecHelper.encode(orderByReleaseYear, forKey: .orderByReleaseYear, container: &container)
      }
      
      if $limit.isSet { 
      try codecHelper.encode(limit, forKey: .limit, container: &container)
      }
      
    }

  }

  public struct Data: Decodable, Sendable {




public struct Movie: Decodable, Sendable ,Hashable, Equatable, Identifiable {
  


public var 
id: UUID



public var 
title: String



public var 
description: String?



public var 
releaseYear: Int?



public var 
rating: Double?



public var 
imageUrl: String


  
  public var movieKey: MovieKey {
    return MovieKey(
      
      id: id
    )
  }

  
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(id)
  
}
public static func == (lhs: Movie, rhs: Movie) -> Bool {
    
    return lhs.id == rhs.id 
        
  }

  

  
  enum CodingKeys: String, CodingKey {
    
    case id
    
    case title
    
    case description
    
    case releaseYear
    
    case rating
    
    case imageUrl
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.id = try codecHelper.decode(UUID.self, forKey: .id, container: &container)
    
    
    
    self.title = try codecHelper.decode(String.self, forKey: .title, container: &container)
    
    
    
    self.description = try codecHelper.decode(String?.self, forKey: .description, container: &container)
    
    
    
    self.releaseYear = try codecHelper.decode(Int?.self, forKey: .releaseYear, container: &container)
    
    
    
    self.rating = try codecHelper.decode(Double?.self, forKey: .rating, container: &container)
    
    
    
    self.imageUrl = try codecHelper.decode(String.self, forKey: .imageUrl, container: &container)
    
    
  }
}
public var 
movies: [Movie]

  }

  public func ref(
        
        
        
        _ optionalVars: ((inout ListMoviesQuery.Variables)->())? = nil
        ) -> QueryRefObservation<ListMoviesQuery.Data,ListMoviesQuery.Variables>  {
        var variables = ListMoviesQuery.Variables()
        
        if let optionalVars {
            optionalVars(&variables)
        }
        

        let ref = dataConnect.query(name: "ListMovies", variables: variables, resultsDataType:ListMoviesQuery.Data.self, publisher: .observableMacro)
        return ref as! QueryRefObservation<ListMoviesQuery.Data,ListMoviesQuery.Variables>
   }

  @MainActor
   public func execute(
        
        
        
        _ optionalVars: (@MainActor (inout ListMoviesQuery.Variables)->())? = nil
        ) async throws -> OperationResult<ListMoviesQuery.Data> {
        var variables = ListMoviesQuery.Variables()
        
        if let optionalVars {
            optionalVars(&variables)
        }
        
        
        let ref = dataConnect.query(name: "ListMovies", variables: variables, resultsDataType:ListMoviesQuery.Data.self, publisher: .observableMacro)
        
        let refCast = ref as! QueryRefObservation<ListMoviesQuery.Data,ListMoviesQuery.Variables>
        return try await refCast.execute()
        
   }
}






public class GetMovieByIdQuery{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "GetMovieById"

  public typealias Ref = QueryRefObservation<GetMovieByIdQuery.Data,GetMovieByIdQuery.Variables>

  public struct Variables: OperationVariable {
  
        
        public var
id: UUID


    
    
    
    public init (
        
id: UUID

        
        ) {
        self.id = id
        

        
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
      
        return lhs.id == rhs.id
              
    }

    
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(id)
  
}

    enum CodingKeys: String, CodingKey {
      
      case id
      
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let codecHelper = CodecHelper<CodingKeys>()
      
      
      try codecHelper.encode(id, forKey: .id, container: &container)
      
      
    }

  }

  public struct Data: Decodable, Sendable {




public struct Movie: Decodable, Sendable ,Hashable, Equatable, Identifiable {
  


public var 
id: UUID



public var 
title: String



public var 
imageUrl: String



public var 
releaseYear: Int?



public var 
genre: String?



public var 
rating: Double?



public var 
description: String?



public var 
tags: [String]?





public struct MovieMetadataMetadata: Decodable, Sendable  {
  


public var 
director: String?


  

  
  enum CodingKeys: String, CodingKey {
    
    case director
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.director = try codecHelper.decode(String?.self, forKey: .director, container: &container)
    
    
  }
}
public var 
metadata: [MovieMetadataMetadata]





public struct ActorMainActors: Decodable, Sendable ,Hashable, Equatable, Identifiable {
  


public var 
id: UUID



public var 
name: String



public var 
imageUrl: String


  
  public var actorMainActorsKey: ActorKey {
    return ActorKey(
      
      id: id
    )
  }

  
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(id)
  
}
public static func == (lhs: ActorMainActors, rhs: ActorMainActors) -> Bool {
    
    return lhs.id == rhs.id 
        
  }

  

  
  enum CodingKeys: String, CodingKey {
    
    case id
    
    case name
    
    case imageUrl
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.id = try codecHelper.decode(UUID.self, forKey: .id, container: &container)
    
    
    
    self.name = try codecHelper.decode(String.self, forKey: .name, container: &container)
    
    
    
    self.imageUrl = try codecHelper.decode(String.self, forKey: .imageUrl, container: &container)
    
    
  }
}
public var 
mainActors: [ActorMainActors]





public struct ActorSupportingActors: Decodable, Sendable ,Hashable, Equatable, Identifiable {
  


public var 
id: UUID



public var 
name: String



public var 
imageUrl: String


  
  public var actorSupportingActorsKey: ActorKey {
    return ActorKey(
      
      id: id
    )
  }

  
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(id)
  
}
public static func == (lhs: ActorSupportingActors, rhs: ActorSupportingActors) -> Bool {
    
    return lhs.id == rhs.id 
        
  }

  

  
  enum CodingKeys: String, CodingKey {
    
    case id
    
    case name
    
    case imageUrl
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.id = try codecHelper.decode(UUID.self, forKey: .id, container: &container)
    
    
    
    self.name = try codecHelper.decode(String.self, forKey: .name, container: &container)
    
    
    
    self.imageUrl = try codecHelper.decode(String.self, forKey: .imageUrl, container: &container)
    
    
  }
}
public var 
supportingActors: [ActorSupportingActors]


  
  public var movieKey: MovieKey {
    return MovieKey(
      
      id: id
    )
  }

  
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(id)
  
}
public static func == (lhs: Movie, rhs: Movie) -> Bool {
    
    return lhs.id == rhs.id 
        
  }

  

  
  enum CodingKeys: String, CodingKey {
    
    case id
    
    case title
    
    case imageUrl
    
    case releaseYear
    
    case genre
    
    case rating
    
    case description
    
    case tags
    
    case metadata
    
    case mainActors
    
    case supportingActors
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.id = try codecHelper.decode(UUID.self, forKey: .id, container: &container)
    
    
    
    self.title = try codecHelper.decode(String.self, forKey: .title, container: &container)
    
    
    
    self.imageUrl = try codecHelper.decode(String.self, forKey: .imageUrl, container: &container)
    
    
    
    self.releaseYear = try codecHelper.decode(Int?.self, forKey: .releaseYear, container: &container)
    
    
    
    self.genre = try codecHelper.decode(String?.self, forKey: .genre, container: &container)
    
    
    
    self.rating = try codecHelper.decode(Double?.self, forKey: .rating, container: &container)
    
    
    
    self.description = try codecHelper.decode(String?.self, forKey: .description, container: &container)
    
    
    self.tags = try codecHelper.decode([String]?.self, forKey: .tags, container: &container)
    
    
    self.metadata = try codecHelper.decode([MovieMetadataMetadata].self, forKey: .metadata, container: &container)
    
    
    self.mainActors = try codecHelper.decode([ActorMainActors].self, forKey: .mainActors, container: &container)
    
    
    self.supportingActors = try codecHelper.decode([ActorSupportingActors].self, forKey: .supportingActors, container: &container)
    
    
  }
}
public var 
movie: Movie?

  }

  public func ref(
        
id: UUID

        ) -> QueryRefObservation<GetMovieByIdQuery.Data,GetMovieByIdQuery.Variables>  {
        var variables = GetMovieByIdQuery.Variables(id:id)
        

        let ref = dataConnect.query(name: "GetMovieById", variables: variables, resultsDataType:GetMovieByIdQuery.Data.self, publisher: .observableMacro)
        return ref as! QueryRefObservation<GetMovieByIdQuery.Data,GetMovieByIdQuery.Variables>
   }

  @MainActor
   public func execute(
        
id: UUID

        ) async throws -> OperationResult<GetMovieByIdQuery.Data> {
        var variables = GetMovieByIdQuery.Variables(id:id)
        
        
        let ref = dataConnect.query(name: "GetMovieById", variables: variables, resultsDataType:GetMovieByIdQuery.Data.self, publisher: .observableMacro)
        
        let refCast = ref as! QueryRefObservation<GetMovieByIdQuery.Data,GetMovieByIdQuery.Variables>
        return try await refCast.execute()
        
   }
}






public class GetIfFavoritedMovieQuery{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "GetIfFavoritedMovie"

  public typealias Ref = QueryRefObservation<GetIfFavoritedMovieQuery.Data,GetIfFavoritedMovieQuery.Variables>

  public struct Variables: OperationVariable {
  
        
        public var
movieId: UUID


    
    
    
    public init (
        
movieId: UUID

        
        ) {
        self.movieId = movieId
        

        
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
      
        return lhs.movieId == rhs.movieId
              
    }

    
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(movieId)
  
}

    enum CodingKeys: String, CodingKey {
      
      case movieId
      
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let codecHelper = CodecHelper<CodingKeys>()
      
      
      try codecHelper.encode(movieId, forKey: .movieId, container: &container)
      
      
    }

  }

  public struct Data: Decodable, Sendable {




public struct FavoriteMovie: Decodable, Sendable  {
  


public var 
movieId: UUID


  

  
  enum CodingKeys: String, CodingKey {
    
    case movieId
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.movieId = try codecHelper.decode(UUID.self, forKey: .movieId, container: &container)
    
    
  }
}
public var 
favorite_movie: FavoriteMovie?

  }

  public func ref(
        
movieId: UUID

        ) -> QueryRefObservation<GetIfFavoritedMovieQuery.Data,GetIfFavoritedMovieQuery.Variables>  {
        var variables = GetIfFavoritedMovieQuery.Variables(movieId:movieId)
        

        let ref = dataConnect.query(name: "GetIfFavoritedMovie", variables: variables, resultsDataType:GetIfFavoritedMovieQuery.Data.self, publisher: .observableMacro)
        return ref as! QueryRefObservation<GetIfFavoritedMovieQuery.Data,GetIfFavoritedMovieQuery.Variables>
   }

  @MainActor
   public func execute(
        
movieId: UUID

        ) async throws -> OperationResult<GetIfFavoritedMovieQuery.Data> {
        var variables = GetIfFavoritedMovieQuery.Variables(movieId:movieId)
        
        
        let ref = dataConnect.query(name: "GetIfFavoritedMovie", variables: variables, resultsDataType:GetIfFavoritedMovieQuery.Data.self, publisher: .observableMacro)
        
        let refCast = ref as! QueryRefObservation<GetIfFavoritedMovieQuery.Data,GetIfFavoritedMovieQuery.Variables>
        return try await refCast.execute()
        
   }
}






public class GetUserFavoriteMoviesQuery{

  let dataConnect: DataConnect

  init(dataConnect: DataConnect) {
    self.dataConnect = dataConnect
  }

  public static let OperationName = "GetUserFavoriteMovies"

  public typealias Ref = QueryRefObservation<GetUserFavoriteMoviesQuery.Data,GetUserFavoriteMoviesQuery.Variables>

  public struct Variables: OperationVariable {

    
    
  }

  public struct Data: Decodable, Sendable {




public struct User: Decodable, Sendable  {
  




public struct FavoriteMovieFavoriteMovies: Decodable, Sendable  {
  




public struct Movie: Decodable, Sendable ,Hashable, Equatable, Identifiable {
  


public var 
id: UUID



public var 
title: String



public var 
genre: String?



public var 
imageUrl: String



public var 
releaseYear: Int?



public var 
rating: Double?



public var 
description: String?


  
  public var movieKey: MovieKey {
    return MovieKey(
      
      id: id
    )
  }

  
public func hash(into hasher: inout Hasher) {
  
  hasher.combine(id)
  
}
public static func == (lhs: Movie, rhs: Movie) -> Bool {
    
    return lhs.id == rhs.id 
        
  }

  

  
  enum CodingKeys: String, CodingKey {
    
    case id
    
    case title
    
    case genre
    
    case imageUrl
    
    case releaseYear
    
    case rating
    
    case description
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.id = try codecHelper.decode(UUID.self, forKey: .id, container: &container)
    
    
    
    self.title = try codecHelper.decode(String.self, forKey: .title, container: &container)
    
    
    
    self.genre = try codecHelper.decode(String?.self, forKey: .genre, container: &container)
    
    
    
    self.imageUrl = try codecHelper.decode(String.self, forKey: .imageUrl, container: &container)
    
    
    
    self.releaseYear = try codecHelper.decode(Int?.self, forKey: .releaseYear, container: &container)
    
    
    
    self.rating = try codecHelper.decode(Double?.self, forKey: .rating, container: &container)
    
    
    
    self.description = try codecHelper.decode(String?.self, forKey: .description, container: &container)
    
    
  }
}
public var 
movie: Movie


  

  
  enum CodingKeys: String, CodingKey {
    
    case movie
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    
    self.movie = try codecHelper.decode(Movie.self, forKey: .movie, container: &container)
    
    
  }
}
public var 
favoriteMovies: [FavoriteMovieFavoriteMovies]


  

  
  enum CodingKeys: String, CodingKey {
    
    case favoriteMovies
    
  }

  public init(from decoder: any Decoder) throws {
    var container = try decoder.container(keyedBy: CodingKeys.self)
    let codecHelper = CodecHelper<CodingKeys>()

    
    self.favoriteMovies = try codecHelper.decode([FavoriteMovieFavoriteMovies].self, forKey: .favoriteMovies, container: &container)
    
    
  }
}
public var 
user: User?

  }

  public func ref(
        
        ) -> QueryRefObservation<GetUserFavoriteMoviesQuery.Data,GetUserFavoriteMoviesQuery.Variables>  {
        var variables = GetUserFavoriteMoviesQuery.Variables()
        

        let ref = dataConnect.query(name: "GetUserFavoriteMovies", variables: variables, resultsDataType:GetUserFavoriteMoviesQuery.Data.self, publisher: .observableMacro)
        return ref as! QueryRefObservation<GetUserFavoriteMoviesQuery.Data,GetUserFavoriteMoviesQuery.Variables>
   }

  @MainActor
   public func execute(
        
        ) async throws -> OperationResult<GetUserFavoriteMoviesQuery.Data> {
        var variables = GetUserFavoriteMoviesQuery.Variables()
        
        
        let ref = dataConnect.query(name: "GetUserFavoriteMovies", variables: variables, resultsDataType:GetUserFavoriteMoviesQuery.Data.self, publisher: .observableMacro)
        
        let refCast = ref as! QueryRefObservation<GetUserFavoriteMoviesQuery.Data,GetUserFavoriteMoviesQuery.Variables>
        return try await refCast.execute()
        
   }
}


