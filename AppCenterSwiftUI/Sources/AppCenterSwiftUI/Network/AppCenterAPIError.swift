import Foundation
import FTAPIKit

enum AppCenterAPIError: APIError {
    case standard(APIError.Standard)
    case custom(ErrorBody)

    static var unhandled: AppCenterAPIError = .standard(.unhandled)

    init?(data: Data?, response: URLResponse?, error: Error?, decoding: Decoding) {
        if let data = data, let error: ErrorWrapper = try? decoding.decode(data: data) {
            self = .custom(error.error)
        } else if let apiError = APIError.Standard(data: data, response: response, error: error, decoding: decoding) {
            self = .standard(apiError)
        } else {
            return nil
        }
    }
}

struct ErrorWrapper: Decodable {
    let error: ErrorBody
}

struct ErrorBody: Decodable {
    let code, message: String
}
