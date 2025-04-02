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

struct HomeScreen {
  @Namespace private var namespace
  @Environment(AuthenticationService.self) private var authenticationService
}

extension HomeScreen {
  private var isSignedIn: Bool {
    false
  }

  private var heroMovies: [Movie] {
    Movie.featured
  }

  private var topMovies: [Movie] {
    Movie.topMovies
  }

  private var watchList: [Movie] {
    Movie.watchList
  }

  private var isEmpty: Bool {
    heroMovies.count == 0
  }

  private func refresh() async {
  }
}

extension HomeScreen: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        if isEmpty {
          GeometryReader { geometry in
            ContentUnavailableView {
              Label("No movies available", systemImage: "rectangle.on.rectangle.slash")
            } description: {
              VStack {
                Text("Follow the instructions in the README.md file to get started.")
              }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
          }
          .frame(height: UIScreen.main.bounds.height)
        } else {
          TabView {
            ForEach(heroMovies) { movie in
              NavigationLink(value: movie) {
                MovieTeaserView(
                  title: movie.title,
                  subtitle: movie.description,
                  imageUrl: movie.imageUrl
                )
                .matchedTransitionSource(id: movie.id, in: namespace)
              }
              .buttonStyle(.noHighlight)
            }
          }
          .frame(height: 600)
          .navigationDestination(for: Movie.self) { movie in
            MovieCardView(showDetails: true, movie: movie)
              .navigationTransition(.zoom(sourceID: movie.id, in: namespace))
          }
          .tabViewStyle(.page(indexDisplayMode: .always))

          Group {
            MovieListSection(namespace: namespace, title: "Top Movies", movies: topMovies)
            if isSignedIn {
              MovieListSection(namespace: namespace, title: "Watch List", movies: watchList)
                .onAppear {
                }
            }
          }
          .navigationDestination(for: [Movie].self) { movies in
            MovieListScreen(in: namespace, movies: movies)
          }
          .navigationDestination(for: SectionedMovie.self) { sectionedMovie in
            MovieCardView(showDetails: true, movie: sectionedMovie.movie)
              .navigationTransition(.zoom(sourceID: sectionedMovie.id, in: namespace))
          }
          .padding()
        }
      }
      .refreshable {
        await refresh()
      }
      .navigationTitle("Home")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          AuthenticationToolbarButton()
        }
      }
      .ignoresSafeArea()
    }
  }
}

#Preview {
  HomeScreen()
    .environment(AuthenticationService())
}
