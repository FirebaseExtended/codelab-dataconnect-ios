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

import SwiftUI

struct SearchedView {
  @Environment(\.isSearching) private var isSearching
  private var namespace: Namespace.ID
  private var filteredMovies = [Movie]()

  private var topMovies: [Movie] {
    Movie.topMovies
  }

  init(in namespace: Namespace.ID, filteredMovies: [Movie] = [Movie]()) {
    self.namespace = namespace
    self.filteredMovies = filteredMovies
  }
}

extension SearchedView: View {
  var body: some View {
    if !isSearching {
      MovieListSection(namespace: namespace, title: "Top Movies", movies: topMovies)
    } else {
      ForEach(filteredMovies) { movie in
        NavigationLink(value: movie) {
          MovieListRowView(
            movie.title,
            subtitle: movie.description,
            imageUrl: movie.imageUrl
          )
          .matchedTransitionSource(id: movie.id, in: namespace)
        }
        .buttonStyle(.noHighlight)
      }
    }
  }
}

struct SearchScreen {
  @State private var searchText: String = ""
  @State private var isStatusBarHidden = false
  @Namespace private var namespace

  private var filteredMovies: [Movie] {
    Movie.mockList.filter { $0.title.lowercased().contains(searchText.lowercased()) }
  }
}

extension SearchScreen: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        SearchedView(in: namespace, filteredMovies: filteredMovies)
          .searchable(text: $searchText)
          .textInputAutocapitalization(.never)
      }
      .padding()
      .navigationTitle("Search")
      .navigationDestination(for: Movie.self) { movie in
        MovieCardView(showDetails: true, movie: movie)
          .navigationTransition(.zoom(sourceID: movie.id, in: namespace))
          .task {
            // NavigationStack requires `.statusBarHidden` to be applied to the navigationstack
            // itself, not on any children.
            // See https://danielsaidi.com/blog/2023/03/14/handling-status-bar-color-scheme-and-visibility-in-swiftui
            isStatusBarHidden = true
          }
      }
      .navigationDestination(for: [Movie].self) { movies in
        MovieListScreen(in: namespace, movies: movies)
      }
      .navigationDestination(for: SectionedMovie.self) { sectionedMovie in
        MovieCardView(showDetails: true, movie: sectionedMovie.movie)
          .navigationTransition(.zoom(sourceID: sectionedMovie.id, in: namespace))
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          AuthenticationToolbarButton()
        }
      }
    }
    .statusBarHidden(isStatusBarHidden)
  }
}

#Preview {
  SearchScreen()
    .environment(AuthenticationService())
}
