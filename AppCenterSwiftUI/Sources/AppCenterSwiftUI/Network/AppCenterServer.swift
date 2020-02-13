import FTAPIKit
import Foundation

/// https://openapi.appcenter.ms
struct AppCenterServer: URLServer {
    typealias ErrorType = AppCenterAPIError

    let urlSession: URLSession = URLSession(configuration: .default)
    let decoding: Decoding = JSONDecoding { decoder in
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.api)
    }
    let encoding: Encoding = JSONEncoding { encoder in
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .formatted(.api)
    }

    var authentication: AppCenterAuthentication?

    var baseUri: URL {
        var components = URLComponents(string: "https://api.appcenter.ms/v0.1/")!
        if case .basic(let authentication) = authentication {
            components.user = authentication.user
            components.password = authentication.password
        }
        return components.url!
    }

    func buildRequest(endpoint: Endpoint) throws -> URLRequest {
        var request = try buildStandardRequest(endpoint: endpoint)
        if case .token(let token) = authentication {
            request.addValue(token, forHTTPHeaderField: "X-API-Token")
        }
        return request
    }
}
