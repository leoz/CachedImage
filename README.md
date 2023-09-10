# CachedImage

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fleoz%2FCachedImage%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/leoz/CachedImage)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fleoz%2FCachedImage%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/leoz/CachedImage)

`CachedImage` is a SwiftUI component to asynchronously load and display an image provided by its URL. 

This package is based on the [AsyncImage](https://github.com/V8tr/AsyncImage) project published by [Vadim Bulavin](https://github.com/V8tr) and described in the [Asynchronous Image Loading from URL in SwiftUI](https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/) article.

## Usage

```swift
// Image URLs to load
let posters = [
    "https://picsum.photos/800/600?random=1",
    "https://picsum.photos/600/800?random=2",
    "https://picsum.photos/800/600?random=3",
    "https://picsum.photos/600/800?random=4"
].map { URL(string: $0)! }

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            List(posters, id: \.self) { url in
                CachedImage(
                    url: url,
                    placeholder: { Text("Loading ...") },
                    image: { Image(platformImage: $0).resizable() }
                )
                .frame(idealHeight: geometry.size.width / 2 * 3) // 2:3 aspect ratio
            }
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
