//
//  EnvironmentValues+ImageCache.swift
//  CachedImage
//
//  Created by Vadim Bulavin on 3/24/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = DefaultImageCache()
}

extension EnvironmentValues {
    public var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
