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

struct RootView {
  @Environment(AuthenticationService.self) private var authenticationService
}

extension RootView: View {
  var body: some View {
    @Bindable var authenticationService = authenticationService
    TabView {
      HomeScreen()
        .tabItem {
          Label("Home", systemImage: "house")
        }
      SearchScreen()
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }
      LibraryScreen()
        .tabItem {
          Label("Library", systemImage: "rectangle.on.rectangle")
        }
    }
    .sheet(isPresented: $authenticationService.presentingAuthenticationDialog) {
      AuthenticationScreen()
    }
    .sheet(isPresented: $authenticationService.presentingAccountDialog) {
      AccountScreen()
    }
  }
}

#Preview {
  RootView()
    .environment(AuthenticationService())
}
