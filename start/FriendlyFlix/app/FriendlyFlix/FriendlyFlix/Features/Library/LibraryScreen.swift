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

struct LibraryScreen {
  @Namespace var namespace
  @Environment(AuthenticationService.self) private var authenticationService

  private var isSignedIn: Bool {
    false
  }

  init() {
  }

  private var watchList: [Movie] {
    Movie.watchList
  }

  private func presentSignInDialog() {
    authenticationService.presentingAuthenticationDialog.toggle()
  }
}

extension LibraryScreen: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        if isSignedIn {
          Group {
            MovieListSection(namespace: namespace, title: "Watch List", movies: watchList)
              .onAppear {
              }
            // TODO: insert section with list of all movies the user has rated
          }
          .padding()
        }
      }
      .navigationTitle("Library")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          AuthenticationToolbarButton()
        }
      }
      .navigationDestination(for: Movie.self) { movie in
        MovieCardView(showDetails: true, movie: movie)
          .navigationTransition(.zoom(sourceID: movie.id, in: namespace))
      }
      .navigationDestination(for: [Movie].self) { movies in
        MovieListScreen(in: namespace, movies: movies)
      }
      .navigationDestination(for: SectionedMovie.self) { sectionedMovie in
        MovieCardView(showDetails: true, movie: sectionedMovie.movie)
          .navigationTransition(.zoom(sourceID: sectionedMovie.id, in: namespace))
      }
    }
    .overlay {
      if !isSignedIn {
        ContentUnavailableView {
          Label("Your library is empty", systemImage: "rectangle.on.rectangle.slash")
        } description: {
          VStack {
            Text("Your watch list and favourites will appear here once you sign in.")
            Button(action: presentSignInDialog) {
              Text("Sign in")
            }
          }
        }
      }
    }
  }
}

#Preview {
  LibraryScreen()
    .environment(AuthenticationService())
}
