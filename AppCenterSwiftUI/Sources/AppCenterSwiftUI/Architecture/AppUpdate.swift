import Foundation

func appUpdate(state: inout AppState, action: AppAction) {
    switch action {
    case .select(let loginMethod):
        state.loginMethod = loginMethod
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
        state.lastError = error.value
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
        state.lastError = error.value
        state.retryableAction = .loadReleaseDetail(info)
        state.downloadingReleases.remove(info)
    case .appsLoadingFailed(let error):
        state.lastError = error.value
        state.retryableAction = .loadApps
    case let .releasesLoadingFailed(app, error):
        state.lastError = error.value
        state.retryableAction = .loadReleases(app)
    case .dismissError:
        state.lastError = nil
    case .retried:
        state.retryableAction = nil
    case .appStarted, .loadApps, .open, .retry:
        break
    }
}
