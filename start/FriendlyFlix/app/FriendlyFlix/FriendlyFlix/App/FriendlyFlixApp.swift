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
import os

@main
struct FriendlyFlixApp: App {
  private let logger = Logger(subsystem: "FriendlyFlix", category: "configuration")

  var authenticationService: AuthenticationService?

  /// Determines whether to use the Firebase Local Emulator Suite.
  /// To use the local emulator, go to the active scheme, and add `-useEmulator YES`
  /// to the _Arguments Passed On Launch_ section.
  public var useEmulator: Bool {
    let value = UserDefaults.standard.bool(forKey: "useEmulator")
    logger.log("Using the emulator: \(value == true ? "YES" : "NO")")
    return value
  }

  init() {
    if useEmulator {
    }

    authenticationService = AuthenticationService()
  }

  var body: some Scene {
    WindowGroup {
      RootView()
        .environment(authenticationService)
    }
  }
}
