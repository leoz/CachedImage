//
//  PlatformImage.swift
//  CachedImage
//
//  Created by Leonid Zolotarev on 9/10/23.
//  Copyright © 2023 Leonid Zolotarev. All rights reserved.
//

import SwiftUI

#if os(macOS)
public typealias PlatformImage = NSImage
#else
public typealias PlatformImage = UIImage
#endif

extension Image {
    @inlinable init(platformImage: PlatformImage) {
        #if os(macOS)
        self.init(nsImage: platformImage)
        #else
        self.init(uiImage: platformImage)
        #endif
    }
}
