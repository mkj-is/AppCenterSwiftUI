import Foundation

func appUpdate(state: inout AppState, action: AppAction) {
    switch action {
    case .login(let auth):
        state.auth = .basic(auth)
    case .authenticate(let token):
        state.auth = .token(token)
    case .authenticated(let user):
        state.user = user
    case .logout:
        state.auth = nil
        state.user = nil
    case .authenticationFailed(let error):
        state.lastError = error.error
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
    case .downloaded(let info):
        state.downloadingReleases.remove(info)
    case let .downloadFailed(info, error):
        state.lastError = error.error
        state.downloadingReleases.remove(info)
    case .appsLoadingFailed(let error), .releasesLoadingFailed(_, let error):
        state.lastError = error.error
    case .dismissError:
        state.lastError = nil
    case .appStarted, .loadApps, .open:
        break
    }
}
