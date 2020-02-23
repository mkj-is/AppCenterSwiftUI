enum RetryableAction: Equatable {
    case loadApps
    case loadReleases(App)
    case loadReleaseDetail(AppRelease)

    var appAction: AppAction {
        switch self {
        case .loadApps:
            return .loadApps
        case .loadReleases(let app):
            return .appSelected(app)
        case .loadReleaseDetail(let info):
            return .loadReleaseDetail(info)
        }
    }
}
