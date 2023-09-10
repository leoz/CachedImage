//
//  ImageCache.swift
//  CachedImage
//
//  Created by Vadym Bulavin on 2/19/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

protocol ImageCache {
    subscript(_ url: URL) -> PlatformImage? { get set }
}

struct TemporaryImageCache: ImageCache {
    private let cache: NSCache<NSURL, PlatformImage> = {
        let cache = NSCache<NSURL, PlatformImage>()
        cache.countLimit = 100 // 100 items
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 MB
        return cache
    }()

    subscript(_ key: URL) -> PlatformImage? {
        get { cache.object(forKey: key as NSURL) }
        set {
            newValue == nil ?
                cache.removeObject(forKey: key as NSURL) :
                cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
}
