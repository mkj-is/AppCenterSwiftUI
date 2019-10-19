import Foundation
import FTAPIKit
import Elementary

private final class APIDelegate: APIAdapterDelegate {
    var token: String?

    func apiAdapter(_ apiAdapter: APIAdapter, didUpdateRunningRequestCount runningRequestCount: UInt) {
        print("Runnning API tasks: \(runningRequestCount)")
    }

    func apiAdapter(_ apiAdapter: APIAdapter, willRequest request: URLRequest, to endpoint: APIEndpoint, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var updatedRequest = request
        if let token = token {
            updatedRequest.addValue(token, forHTTPHeaderField: "X-API-Token")
        }

        completion(.success(updatedRequest))
    }


}

func createNetworkEffect() -> Effect<AppState, AppAction> {
    let server = AppCenterServer()
    let delegate = APIDelegate()
    let adapter = URLSessionAPIAdapter(baseUrl: server.baseUri, jsonEncoder: server.jsonEncoder, jsonDecoder: server.jsonDecoder, errorType: server.errorType, urlSession: server.urlSession)
    adapter.delegate = delegate
    return { state, action, dispatch in
        switch action {
        case .authenticate(let token):
            delegate.token = token
            adapter.request(response: UserEndpoint()) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let user):
                        dispatch(.authenticated(user: user))
                        dispatch(.loadApps)
                    case .failure(let error):
                        dispatch(.authenticationFailed(error))
                    }
                }
            }
        case .loadApps:
            adapter.request(response: AppsEndpoint()) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let apps):
                        dispatch(.appsLoaded(apps))
                    case .failure(let error):
                        dispatch(.authenticationFailed(error))
                    }
                }
            }
        default:
            break
        }
    }
}
