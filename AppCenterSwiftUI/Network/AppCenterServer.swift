import FTAPIKit
import Foundation

/// https://openapi.appcenter.ms
struct AppCenterServer: APIServer {
    let baseUri = URL(string: "https://api.appcenter.ms/v0.1/")!
    let urlSession: URLSession = URLSession(configuration: .default)
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter())
        return decoder
    }()

    let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .formatted(dateFormatter())
        return encoder
    }()

    let errorType: APIError.Type = APIErrorCapsule.self

    private static func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }
}
