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
    case .appStarted, .loadApps, .appsLoadingFailed, .releasesLoadingFailed,
         .loadReleaseDetail, .releaseDetailLoaded, .releaseDetailLoadingFailed,
         .open:
            break
    }
}
