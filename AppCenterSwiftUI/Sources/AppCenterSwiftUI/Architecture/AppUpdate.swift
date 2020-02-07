import Foundation

func appUpdate(state: inout AppState, action: AppAction) {
    switch action {
    case .goBack:
        state.loginBrowserOpened = false
    case .authenticate(let token):
        state.apiToken = token
    case .authenticated(let user):
        state.user = user
    case .authenticationFailed, .logout:
        state.apiToken = nil
        state.user = nil
    case .openAuthentication:
        state.loginBrowserOpened = true
    case .appsLoaded(let apps):
        state.apps = apps
    case .appSelected(let app):
        state.selectedApp = app
    case let .releasesLoaded(app, releases):
        state.releases[app] = releases
    case .appStarted, .loadApps, .appsLoadingFailed, .releasesLoadingFailed:
        break
    }
}
