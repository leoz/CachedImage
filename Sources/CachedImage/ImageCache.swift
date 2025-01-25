//
//  ImageCache.swift
//  CachedImage
//
//  Created by Vadym Bulavin on 2/19/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

public protocol ImageCache {
    subscript(_ url: URL) -> PlatformImage? { get set }
}

public struct DefaultImageCache: ImageCache {
    private let cache: NSCache<NSURL, PlatformImage>

    public init(
        countLimit: Int,
        totalCostLimit: Int
    ) {
        self.cache = {
            let cache = NSCache<NSURL, PlatformImage>()
            cache.countLimit = countLimit
            cache.totalCostLimit = totalCostLimit
            return cache
        }()
    }

    public init() {
        self.init(
            countLimit: 100,  // 100 items
            totalCostLimit: 1024 * 1024 * 100  // 100 MB
        )
    }

    public subscript(_ key: URL) -> PlatformImage? {
        get { cache.object(forKey: key as NSURL) }
        set {
            newValue == nil
                ? cache.removeObject(forKey: key as NSURL)
                : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
}
