import Foundation

func appUpdate(state: inout AppState, action: AppAction) {
    switch action {
    case .login(let auth):
        state.auth = .basic(auth)
    case .authenticate(let token):
        state.auth = .token(token)
    case .authenticated(let user):
        state.user = user
    case .authenticationFailed, .logout:
        state.auth = nil
        state.user = nil
    case .appsLoaded(let apps):
        state.apps = apps
    case .appSelected(let app):
        state.selectedApp = app
    case let .releasesLoaded(app, releases):
        state.releases[app] = releases
    case .loadReleaseDetail(let detail):
        state.downloadingReleases.insert(detail)
    case .releaseDetailLoadingFailed(let info):
        state.downloadingReleases.remove(info.0)
    case .releaseDetailLoaded(let detail):
        state.downloadingReleases.remove(AppRelease(app: detail.0, release: detail.1.release))
    case .appStarted, .loadApps, .appsLoadingFailed, .releasesLoadingFailed, .open:
            break
    }
}
