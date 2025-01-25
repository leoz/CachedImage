# CachedImage

[![Build](https://github.com/leoz/CachedImage/actions/workflows/swift.yml/badge.svg?branch=master)](https://github.com/leoz/CachedImage/actions/workflows/swift.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fleoz%2FCachedImage%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/leoz/CachedImage)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fleoz%2FCachedImage%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/leoz/CachedImage)
![License](https://img.shields.io/github/license/leoz/CachedImage)

<p align="center">
    <img src="https://github.com/leoz/CachedImage/blob/master/Assets/demo.gif" style="margin: auto; width: 295px"/>
</p>

## 🔭 Overview

`CachedImage` is a SwiftUI component to asynchronously load and display an image provided by its URL.

This package is based on the [AsyncImage](https://github.com/V8tr/AsyncImage) project published by [Vadim Bulavin](https://github.com/V8tr) and described in the [Asynchronous Image Loading from URL in SwiftUI](https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/) article.

## 🛠️ Usage

### Quick Start

```swift
import CachedImage

let images = (0...20).map {
    "https://picsum.photos/800/600?random=\($0)"
}
let imageURLs = images.map {
    URL(string: $0)!
}

struct ContentView: View {
    var body: some View {
        List(imageURLs, id: \.self) { url in
            CachedImage(
                url: url,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    Text("Loading ...")
                }
            )
            .scaledToFit()
        }
    }
}
```

### Demo Program

Check the demo project provided here: [Demo](./Demo/).

## ✍️ Author

[Vadim Bulavin](https://github.com/V8tr) & [Leonid Zolotarev](https://github.com/leoz)

## 📃 License

`CachedImage` is available under the Unlicense. See the [LICENSE](./LICENSE.md) file for more info.
