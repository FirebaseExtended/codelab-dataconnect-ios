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
import NukeUI
import os

struct MovieCardView {
  private let logger = Logger(subsystem: "FriendlyFlix", category: "moviecard")
  @Environment(\.dismiss) private var dismiss

  private var showDetails: Bool = false
  private var movie: Movie

  public init(showDetails: Bool, movie: Movie) {
    self.showDetails = showDetails
    self.movie = movie
  }

  // MARK: - Favourite handling

  private var isFavourite: Bool {
    return false
  }

  private func toggleFavourite() {
  }
}

extension MovieCardView: View {
  var body: some View {
    CardView(showDetails: showDetails) {
      if let imageUrl = URL(string: movie.imageUrl) {
        LazyImage(url: imageUrl) { state in
          if let image = state.image {
            image
              .resizable()
              .scaledToFill()
              .frame(maxWidth: .infinity)
              .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
          } else if state.error != nil {
            Color.red
              .frame(maxWidth: .infinity)
              .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
              .redacted(if: true)
          } else {
            Image(systemName: "photo.artframe")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(maxWidth: .infinity)
              .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
              .redacted(reason: .placeholder)
          }
        }
        .frame(maxWidth: .infinity)
      }
    } heroTitle: {
      VStack(alignment: .leading) {
        Spacer()
        HStack {
          VStack(alignment: .leading) {
            Text(movie.title)
              .multilineTextAlignment(.leading)
              .font(.title)
              .bold()
            if let releaseYear = movie.releaseYear {
              Text("Released: \(format: releaseYear, using: .none)")
            }
          }
          Spacer()
        }
        .padding()
        .background(.thinMaterial)
      }
    } details: {
      MovieDetailsView(movie: movie)
    }
    .toolbar {
      ToolbarItem {
        Button {
          toggleFavourite()
        } label: {
          Image(systemName: isFavourite ? "heart.fill" : "heart")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
        }
      }
      ToolbarItem {
        Button {
          dismiss()
        } label: {
          Image(systemName: "xmark")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
        }
      }
    }
    .task {
    }
  }
}

#Preview {
  MovieCardView(showDetails: true, movie: Movie.mock)
}
