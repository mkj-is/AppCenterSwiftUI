import Foundation

func appUpdate(state: inout AppState, action: AppAction) {
    switch action {
    case .goBack:
        state.loginBrowserOpened = false
    case .authenticate(let token):
        state.apiToken = token
    case .authenticated(let user):
        state.user = user
    case .authenticationFailed:
        state.apiToken = nil
        state.user = nil
    case .openAuthentication:
        state.loginBrowserOpened = true
    case .appsLoaded(let apps):
        state.apps = apps
    case .loadApps, .appsLoadingFailed:
        break
    }
}
