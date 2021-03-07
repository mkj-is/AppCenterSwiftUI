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
                DispatchQueue.main.async(execute: ^dispatch(action))
            }
            guard let url = url else {
                let error = AppCenterAPIError(data: nil, response: response, error: error, decoding: server.decoding)
                    ?? AppCenterAPIError.unhandled
                dispatchMain(.downloadFailed(info, Equalized(value: error)))
                return
            }
            let manager = FileManager.default
            let folder = manager.homeDirectoryForCurrentUser
                .appendingPathComponent("Downloads")
            let nextFreeName = DownloadName(app: app, releaseDetail: releaseDetail, folder: folder, manager: manager).url

            do {
                try manager.moveItem(at: url, to: nextFreeName)
            } catch {
                dispatchMain(.downloadFailed(info, Equalized(value: error)))
                return
            }
            dispatchMain(.downloaded(info))
        }.resume()
    }
    #elseif os(iOS)
    if let installUrl = releaseDetail.installUrl {
        dispatch(.open(url: installUrl))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: ^dispatch(.downloaded(info)))
    }
    #endif
}

private struct DownloadName {
    let app: App
    let releaseDetail: ReleaseDetail
    let folder: URL
    let manager: FileManager

    var fileExtension: String {
        switch app.os {
        case .android:
            return "apk"
        case .iOS, .tvOS, .macOS:
            return "zip"
        default:
            return "unknown"
        }
    }

    var url: URL {
        for index in 0... {
            let generatedUrl = folder.appendingPathComponent(name(app: app, release: releaseDetail, index: index))
            if !manager.fileExists(atPath: generatedUrl.absoluteString) {
                return generatedUrl
            }
        }
        fatalError("Not accesible code path")
    }

    private func name(app: App, release: ReleaseDetail, index: Int) -> String {
        let build = index == 0 ? "\(release.version)" : "\(release.version)-\(index)"
        return "\(app.displayName) - \(releaseDetail.shortVersion) (\(build)).\(fileExtension)"
    }
}
