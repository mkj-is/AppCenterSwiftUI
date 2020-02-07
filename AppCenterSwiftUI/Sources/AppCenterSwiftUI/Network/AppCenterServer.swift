import FTAPIKit
import Foundation

/// https://openapi.appcenter.ms
struct AppCenterServer: URLServer {
    typealias ErrorType = AppCenterAPIError

    let baseUri = URL(string: "https://api.appcenter.ms/v0.1/")!
    let urlSession: URLSession = URLSession(configuration: .default)
    let decoding: Decoding = JSONDecoding { decoder in
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.api)
    }
    let encoding: Encoding = JSONEncoding { encoder in
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .formatted(.api)
    }

    var token: String?

    func buildRequest(endpoint: Endpoint) throws -> URLRequest {
        var request = try buildStandardRequest(endpoint: endpoint)
        if endpoint is AuthorizedEndpoint, let token = token {
            request.addValue(token, forHTTPHeaderField: "X-API-Token")
        }
        return request
    }
}
