import Foundation
import FTAPIKit
import Elementary

func createNetworkEffect() -> Effect<AppState, AppAction> {
    var server = AppCenterServer()
    return { state, action, dispatch in
        switch action {
        case .login(let auth):
            server.authentication = .basic(auth)
            server.call(response: PostTokenEndpoint()) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        dispatch(.authenticate(token: response.apiToken))
                    case .failure(let error):
                        dispatch(.authenticationFailed(AppError(error: error)))
                    }
                }
            }
        case .authenticate(let token):
            server.authentication = .token(token)
            server.call(response: UserEndpoint()) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let user):
                        dispatch(.authenticated(user: user))
                        dispatch(.loadApps)
                    case .failure(let error):
                        dispatch(.authenticationFailed(AppError(error: error)))
                    }
                }
            }
        case .loadApps:
            server.call(response: AppsEndpoint()) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let apps):
                        dispatch(.appsLoaded(apps))
                        let currentState = state()
                        if currentState.selectedApp == nil, let firstApp = apps.first {
                            dispatch(.appSelected(firstApp))
                        }
                    case .failure(let error):
                        dispatch(.appsLoadingFailed(AppError(error: error)))
                    }
                }
            }
        case .appSelected(let app):
            server.call(response: ReleasesEnpoint(ownerName: app.owner.name, appName: app.name)) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let releases):
                        dispatch(.releasesLoaded(app, releases))
                    case .failure(let error):
                        dispatch(.releasesLoadingFailed(app, AppError(error: error)))
                    }
                }
            }
        case .loadReleaseDetail(let info):
            let endpoint = ReleaseEnpoint(ownerName: info.app.owner.name, appName: info.app.name, releaseId: info.release.id)
            server.call(response: endpoint) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let releaseDetail):
                        dispatch(.releaseDetailLoaded(info.app, releaseDetail))
                        if let downloadUrl = releaseDetail.downloadUrl {
                            server.urlSession.downloadTask(with: downloadUrl) { url, reponse, error in
                                if let url = url {
                                    let manager = FileManager.default
                                    let downloadsUrl = manager.homeDirectoryForCurrentUser
                                        .appendingPathComponent("Downloads")
                                        .appendingPathComponent(releaseDetail.downloadUrl?.lastPathComponent ?? url.lastPathComponent)
                                    try! manager.moveItem(at: url, to: downloadsUrl)
                                } else {
                                    DispatchQueue.main.async {
                                        dispatch(.releaseDetailLoadingFailed(info, AppError(error: error ?? AppCenterAPIError.unhandled)))
                                    }
                                }
                            }.resume()
                        }
                    case .failure(let error):
                        dispatch(.releaseDetailLoadingFailed(info, AppError(error: error)))
                    }
                }
            }
        case .logout:
            server.authentication = nil
        default:
            break
        }
    }
}
