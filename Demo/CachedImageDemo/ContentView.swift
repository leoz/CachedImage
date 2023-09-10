//
//  ContentView.swift
//  CachedImageDemo
//
//  Created by Vadym Bulavin on 2/13/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
