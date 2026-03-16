# SVGKit

[![CI](https://github.com/DesignPipe/swift-svgkit/actions/workflows/ci.yml/badge.svg)](https://github.com/DesignPipe/swift-svgkit/actions/workflows/ci.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FDesignPipe%2Fswift-svgkit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/DesignPipe/swift-svgkit)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FDesignPipe%2Fswift-svgkit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/DesignPipe/swift-svgkit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/DesignPipe/swift-svgkit/blob/main/LICENSE)

SVG parsing and Android-native format generation in Swift.

Converts SVG files to:
- **ImageVector** (Jetpack Compose Kotlin code)
- **VectorDrawable** (Android XML resource)

## Features

- Full SVG path parsing (`d` attribute) with arc, cubic/quadratic bezier support
- Gradient support (linear, radial) with transform matrices
- SVG group hierarchy preservation
- Stroke dash patterns
- CSS inline styles
- `<use>`/`<symbol>` element expansion
- Path data validation and normalization
- Cross-platform: macOS, Linux, Windows

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/DesignPipe/swift-svgkit.git", from: "0.1.0"),
]
```

Then add `SVGKit` to your target's dependencies:

```swift
.target(
    name: "MyTarget",
    dependencies: [
        .product(name: "SVGKit", package: "swift-svgkit"),
    ]
)
```

## Usage

### Parse SVG and generate ImageVector (Kotlin)

```swift
import SVGKit

let svgContent = "<svg>...</svg>"
let parsed = try SVGParser.parse(content: svgContent, iconName: "MyIcon")
let kotlin = ImageVectorGenerator.generate(from: parsed, iconName: "MyIcon")
print(kotlin)
```

### Parse SVG and generate VectorDrawable (XML)

```swift
import SVGKit

let svgContent = "<svg>...</svg>"
let parsed = try SVGParser.parse(content: svgContent, iconName: "MyIcon")
let xml = VectorDrawableXMLGenerator.generate(from: parsed, iconName: "MyIcon")
print(xml)
```

### Convert SVG to native VectorDrawable (via resvg)

```swift
import SVGKit

let svgContent = "<svg>...</svg>"
let xml = try NativeVectorDrawableConverter.convert(svgContent: svgContent, iconName: "MyIcon")
print(xml)
```

## Requirements

- Swift 6.2+
- macOS 13+ / Linux (Ubuntu 22.04+) / Windows

## Dependencies

| Package | Purpose |
|---------|---------|
| [swift-log](https://github.com/apple/swift-log) | Structured logging |
| [swift-resvg](https://github.com/alexey1312/swift-resvg) | SVG tree parsing via resvg |

## License

MIT
