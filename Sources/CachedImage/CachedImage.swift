//
//  CachedImage.swift
//  CachedImage
//
//  Created by Vadym Bulavin on 2/13/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

public struct CachedImage<Placeholder: View, Content: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let content: (Image) -> Content
    private let url: URL

    public init(
        url: URL,
        placeholder: @escaping () -> Placeholder,
        content: @escaping (Image) -> Content
    ) {
        self.placeholder = placeholder()
        self.content = content
        self.url = url
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }

    public var body: some View {
        contentOrImage
            .onAppear(perform: loader.load)
            .onChange(of: url) { newUrl in
                loader.reload(url: newUrl)
            }
    }

    @ViewBuilder
    private var contentOrImage: some View {
        if let platformImage = loader.image {
            content(Image(platformImage: platformImage))
        } else {
            placeholder
        }
    }
}
