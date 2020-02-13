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

    let baseUri = URL(string: "https://api.appcenter.ms/v0.1/")!

    func buildRequest(endpoint: Endpoint) throws -> URLRequest {
        var request = try buildStandardRequest(endpoint: endpoint)
        switch authentication {
        case .token(let token):
            request.addValue(token, forHTTPHeaderField: "X-API-Token")
        case .basic(let auth):
            let data = Data(auth.description.utf8).base64EncodedString()
            request.addValue("Basic \(data)", forHTTPHeaderField: "Authorization")
        case nil:
            break
        }
        return request
    }
}
