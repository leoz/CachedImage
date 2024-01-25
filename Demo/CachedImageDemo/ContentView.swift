//
//  ContentView.swift
//  CachedImageDemo
//
//  Created by Vadym Bulavin on 2/13/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI
import CachedImage

let images = (0...200).map {
    "https://picsum.photos/800/600?random=\($0)"
}
let imageURLs = images.map {
    URL(string: $0)!
}

struct ContentView: View {
    let imageCache = DefaultImageCache(
        countLimit: 10000, // 10000 items
        totalCostLimit: 1024 * 1024 * 500 // 500 MB
    )

    var body: some View {
        List(imageURLs, id: \.self) { url in
            CachedImage(
                url: url,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                },
                placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            )
            .listRowSeparator(.hidden)
        }
        .environment(\.imageCache, imageCache)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
