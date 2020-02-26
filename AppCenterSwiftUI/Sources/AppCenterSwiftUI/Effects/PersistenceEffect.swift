import Elementary
import Foundation

func createPersistenceEffect(defaults: UserDefaults = .standard) -> Effect<AppState, AppAction> {
    let tokenKey = "tokenKey"
    return { state, action, dispatch in
        switch action {
        case .appStarted:
            defaults.string(forKey: tokenKey).flatMap { dispatch(.authenticate(token: $0)) }
        case .authenticate(let token):
            defaults.set(token, forKey: tokenKey)
        case .logout:
            defaults.removeObject(forKey: tokenKey)
        default:
            break
        }
    }
}
