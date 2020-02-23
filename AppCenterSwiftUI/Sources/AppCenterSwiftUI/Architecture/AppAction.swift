import struct Foundation.URL

enum AppAction: Equatable {
    case appStarted
    case login(BasicAuthentication)
    case authenticate(token: String)
    case authenticated(user: User)
    case authenticationFailed(EqualError)
    case logout
    case loadApps
    case appsLoaded([App])
    case appsLoadingFailed(EqualError)
    case appSelected(App)
    case releasesLoaded(App, [Release])
    case releasesLoadingFailed(App, EqualError)
    case loadReleaseDetail(AppRelease)
    case downloadFailed(AppRelease, EqualError)
    case downloaded(AppRelease)
    case open(url: URL)
    case dismissError
}
