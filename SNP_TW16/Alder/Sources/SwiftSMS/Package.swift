// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSMS",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftSMS",
            targets: ["SwiftSMS"]),
    ],
    dependencies: [
               .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftSMS",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "SwiftSMSTests",
            dependencies: ["Alamofire"]),
    ]
)
