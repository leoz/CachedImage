//
//  ContentView.swift
//  CachedImageDemo
//
//  Created by Vadym Bulavin on 2/13/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI
import CachedImage

let posters = [
    "https://picsum.photos/800/600?random=1",
    "https://picsum.photos/600/800?random=2",
    "https://picsum.photos/800/600?random=3",
    "https://picsum.photos/600/800?random=4"
].map { URL(string: $0)! }

struct ContentView: View {
    var body: some View {
         List(posters, id: \.self) { url in
             CachedImage(
                url: url,
                placeholder: { Text("Loading ...") },
                image: { Image(platformImage: $0).resizable() }
             )
            //.frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
