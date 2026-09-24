// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "iOSMcuManagerLibrary",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "iOSMcuManagerLibrary",
            targets: ["iOSMcuManagerLibrary"]
        ),
        .library(
            name: "iOSOtaLibrary",
            targets: ["iOSOtaLibrary"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Medico-Supplies/SwiftCBOR.git",
            .exact("0.6.0")
        ),
        .package(
            url: "https://github.com/Medico-Supplies/ZIPFoundation",
            .exact("0.9.20")
        ),
        .package(
            url: "https://github.com/Medico-Supplies/IOS-BLE-Library",
            .exact("0.4.5")
        ),
        .package(
            url: "https://github.com/Medico-Supplies/IOS-Common-Libraries",
            .exact("0.2.5") // change to 0.2.4 if build has errors with swift version features
        )
    ],
    targets: [
        .target(
            name: "iOSMcuManagerLibrary",
            dependencies: ["SwiftCBOR", "ZIPFoundation"],
            path: "iOSMcuManagerLibrary/Source",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "iOSOtaLibrary",
            dependencies: [
                .byNameItem(name: "iOSMcuManagerLibrary", condition: nil),
                .product(name: "iOS-BLE-Library-Mock", package: "IOS-BLE-Library"),
                .product(name: "iOSCommonLibraries", package: "IOS-Common-Libraries")
            ],
            path: "iOSOtaLibrary/Source"
        )
    ]
)
