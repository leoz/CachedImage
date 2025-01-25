//
//  ImageLoader.swift
//  CachedImage
//
//  Created by Vadym Bulavin on 2/13/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: PlatformImage?

    private(set) var isLoading = false

    private var cache: ImageCache?
    private var cancellable: AnyCancellable?

    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

    init() {
    }

    deinit {
        cancel()
    }

    func setCache(cache: ImageCache? = nil) {
        self.cache = cache
    }

    func load(url: URL) {
        guard !isLoading else { return }

        if let image = cache?[url] {
            self.image = image
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { PlatformImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(
                receiveSubscription: { [weak self] _ in self?.onStart() },
                receiveOutput: { [weak self] in self?.cache($0, url) },
                receiveCompletion: { [weak self] _ in self?.onFinish() },
                receiveCancel: { [weak self] in self?.onFinish() }
            )
            .subscribe(on: Self.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }

    func reload(url: URL) {
        cancel()
        load(url: url)
    }

    func cancel() {
        cancellable?.cancel()
    }

    private func onStart() {
        isLoading = true
    }

    private func onFinish() {
        isLoading = false
    }

    private func cache(_ image: PlatformImage?, _ url: URL) {
        image.map { cache?[url] = $0 }
    }
}
