import Combine
import SwiftUI

#if os(macOS)
typealias PlatformImage = NSImage

extension Image {
    init(platformImage: PlatformImage) {
        self.init(nsImage: platformImage)
    }
}
#else
typealias PlatformImage = UIImage

extension Image {
    init(platformImage: PlatformImage) {
        self.init(uiImage: platformImage)
    }
}
#endif

private extension URLSession {
    static let images: URLSession = {
        let cachePath = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).absoluteString
        let cache = URLCache(memoryCapacity: 1_024 * 1_024 * 8, diskCapacity: 1_024 * 1_024 * 64, diskPath: cachePath)
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = cache
        configuration.requestCachePolicy = .useProtocolCachePolicy
        let session = URLSession(configuration: configuration)
        return session
    }()
}

struct WebImage<Placeholder: View>: View {
    let placeholder: Placeholder
    let url: URL?
    let urlSession: URLSession = .images
    @State private var image: PlatformImage?

    private func dataPublisher() -> AnyPublisher<Data?, Never> {
        if let url = url {
            return urlSession
                .dataTaskPublisher(for: url)
                .map { $0.data }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        return Just(nil).eraseToAnyPublisher()
    }

    var body: some View {
        if image != nil {
            Image(platformImage: image!)
                .resizable()
        } else {
            placeholder
                .onReceive(dataPublisher()) { output in
                    self.image = output.flatMap(PlatformImage.init(data:))
                }
        }
    }
}
