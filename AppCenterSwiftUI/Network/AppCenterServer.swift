import FTAPIKit
import Foundation

/// https://openapi.appcenter.ms
struct AppCenterServer: APIServer {
    let baseUri = URL(string: "https://api.appcenter.ms/v0.1/")!
    let urlSession: URLSession = URLSession(configuration: .default)
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    let errorType: APIError.Type = APIErrorCapsule.self
}
