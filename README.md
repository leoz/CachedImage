# CachedImage

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fleoz%2FCachedImage%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/leoz/CachedImage)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fleoz%2FCachedImage%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/leoz/CachedImage)

`CachedImage` is a SwiftUI component to asynchronously load and display an image provided by its URL. 

This package is based on the [AsyncImage](https://github.com/V8tr/AsyncImage) project published by [Vadim Bulavin](https://github.com/V8tr) and described in the [Asynchronous Image Loading from URL in SwiftUI](https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/) article.

## Usage

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

## Demo

Check the demo project provided [here](./Demo/).

<p align="center">
  <img src="./demo.gif" alt="How to load image from URL asynchronously in SwiftUI"/>
</p>

## License

[Unlicensed](./LICENSE.md)
