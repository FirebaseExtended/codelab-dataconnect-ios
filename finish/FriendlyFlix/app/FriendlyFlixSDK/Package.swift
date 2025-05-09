// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

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


import PackageDescription

let package = Package(
    name: "FriendlyFlixSDK",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "FriendlyFlixSDK",
            targets: ["FriendlyFlixSDK"]),
    ],
    dependencies: [

        .package(url: "https://github.com/firebase/data-connect-ios-sdk", from: "11.3.0-beta"),

    ],
    targets: [
        .target(
            name: "FriendlyFlixSDK",
            dependencies: [
              .product(name:"FirebaseDataConnect", package:"data-connect-ios-sdk")
            ],
            path: "Sources"
        )
    ]
)

