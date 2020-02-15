
import Foundation
#if os(iOS)
import UIKit
#endif

func download(server: AppCenterServer, app: App, releaseDetail: ReleaseDetail, dispatch: @escaping (AppAction) -> Void) {
    let info = AppRelease(app: app, release: releaseDetail.release)
    #if os(macOS)
    if let downloadUrl = releaseDetail.downloadUrl {
        server.urlSession.downloadTask(with: downloadUrl) { url, response, error in
            func dispatchMain(_ action: AppAction) {
                DispatchQueue.main.async {
                    dispatch(action)
                }
            }
            guard let url = url else {
                let error = AppCenterAPIError(data: nil, response: response, error: error, decoding: server.decoding)
                    ?? AppCenterAPIError.unhandled
                dispatchMain(.downloadFailed(info, EquatableError(error: error)))
                return
            }
            let manager = FileManager.default
            let downloadsUrl = manager.homeDirectoryForCurrentUser
                .appendingPathComponent("Downloads")
                .appendingPathComponent(releaseDetail.downloadUrl?.lastPathComponent ?? url.lastPathComponent)

            do {
                try manager.moveItem(at: url, to: downloadsUrl)
            } catch {
                dispatchMain(.downloadFailed(info, EquatableError(error: error)))
                return
            }
            dispatchMain(.downloaded(info))
        }.resume()
    }
    #elseif os(iOS)
    if let installUrl = releaseDetail.installUrl {
        dispatch(.open(installUrl))
    }
    #endif
}
