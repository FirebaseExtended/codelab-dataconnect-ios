// Copyright 2025 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import FirebaseDataConnect
import FriendlyFlixSDK

extension Movie {
  init(from: ListMoviesQuery.Data.Movie) {
    id = from.id
    title = from.title
    description = from.description ?? ""
    releaseYear = from.releaseYear
    rating = from.rating
    imageUrl = from.imageUrl
  }

  init(from: GetUserFavoriteMoviesQuery.Data.User.FavoriteMovieFavoriteMovies) {
    id = from.movie.id
    title = from.movie.title
    description = from.movie.description ?? ""
    releaseYear = from.movie.releaseYear
    rating = from.movie.rating
    imageUrl = from.movie.imageUrl
  }
}
