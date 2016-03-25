import PackageDescription

let package = Package(
    name: "Log",
    dependencies: [
        .Package(url: "https://github.com/Zewo/Data.git", majorVersion: 0, minor: 4),
    ]
)
