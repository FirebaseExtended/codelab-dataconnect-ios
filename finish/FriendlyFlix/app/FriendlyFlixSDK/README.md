This Swift package contains the generated Swift code for the connector `friendly-flix`.

You can use this package by adding it as a local Swift package dependency in your project.

# Accessing the connector

Add the necessary imports

```
import FirebaseDataConnect
import FriendlyFlixSDK

```

The connector can be accessed using the following code:

```
let connector = DataConnect.friendlyFlixConnector

```


## Connecting to the local Emulator
By default, the connector will connect to the production service.

To connect to the emulator, you can use the following code, which can be called from the `init` function of your SwiftUI app

```
connector.useEmulator()
```

# Queries

## ListMoviesQuery
### Variables


#### Optional
```swift

let orderByRating: OrderDirection = ...
let orderByReleaseYear: OrderDirection = ...
let limit: Int = ...
```



### Using the Query Reference
```
struct MyView: View {
   var listMoviesQueryRef = DataConnect.friendlyFlixConnector.listMoviesQuery.ref(...)

  var body: some View {
    VStack {
      if let data = listMoviesQueryRef.data {
        // use data in View
      }
      else {
        Text("Loading...")
      }
    }
    .task {
        do {
          let _ = try await listMoviesQueryRef.execute()
        } catch {
        }
      }
  }
}
```

### One-shot execute
```
DataConnect.friendlyFlixConnector.listMoviesQuery.execute(...)
```


## GetMovieByIdQuery
### Variables
#### Required
```swift

let id: UUID = ...
```




### Using the Query Reference
```
struct MyView: View {
   var getMovieByIdQueryRef = DataConnect.friendlyFlixConnector.getMovieByIdQuery.ref(...)

  var body: some View {
    VStack {
      if let data = getMovieByIdQueryRef.data {
        // use data in View
      }
      else {
        Text("Loading...")
      }
    }
    .task {
        do {
          let _ = try await getMovieByIdQueryRef.execute()
        } catch {
        }
      }
  }
}
```

### One-shot execute
```
DataConnect.friendlyFlixConnector.getMovieByIdQuery.execute(...)
```


## GetIfFavoritedMovieQuery
### Variables
#### Required
```swift

let movieId: UUID = ...
```




### Using the Query Reference
```
struct MyView: View {
   var getIfFavoritedMovieQueryRef = DataConnect.friendlyFlixConnector.getIfFavoritedMovieQuery.ref(...)

  var body: some View {
    VStack {
      if let data = getIfFavoritedMovieQueryRef.data {
        // use data in View
      }
      else {
        Text("Loading...")
      }
    }
    .task {
        do {
          let _ = try await getIfFavoritedMovieQueryRef.execute()
        } catch {
        }
      }
  }
}
```

### One-shot execute
```
DataConnect.friendlyFlixConnector.getIfFavoritedMovieQuery.execute(...)
```


## GetUserFavoriteMoviesQuery


### Using the Query Reference
```
struct MyView: View {
   var getUserFavoriteMoviesQueryRef = DataConnect.friendlyFlixConnector.getUserFavoriteMoviesQuery.ref(...)

  var body: some View {
    VStack {
      if let data = getUserFavoriteMoviesQueryRef.data {
        // use data in View
      }
      else {
        Text("Loading...")
      }
    }
    .task {
        do {
          let _ = try await getUserFavoriteMoviesQueryRef.execute()
        } catch {
        }
      }
  }
}
```

### One-shot execute
```
DataConnect.friendlyFlixConnector.getUserFavoriteMoviesQuery.execute(...)
```


# Mutations
## UpsertUserMutation

### Variables

#### Required
```swift

let username: String = ...
```
 

### One-shot execute
```
DataConnect.friendlyFlixConnector.upsertUserMutation.execute(...)
```

## AddFavoritedMovieMutation

### Variables

#### Required
```swift

let movieId: UUID = ...
```
 

### One-shot execute
```
DataConnect.friendlyFlixConnector.addFavoritedMovieMutation.execute(...)
```

## DeleteFavoritedMovieMutation

### Variables

#### Required
```swift

let movieId: UUID = ...
```
 

### One-shot execute
```
DataConnect.friendlyFlixConnector.deleteFavoritedMovieMutation.execute(...)
```

