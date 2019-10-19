import Foundation
import FTAPIKit

struct APIErrorCapsule: Decodable, APIError {
    init?(data: Data?, response: URLResponse?, error: Error?, decoder: JSONDecoder) {
        if let data = data, let error = try? decoder.decode(APIErrorCapsule.self, from: data) {
            self = error
        } else {
            return nil
        }
    }

    let error: APIErrorBody
}

struct APIErrorBody: Decodable {
    let code, message: String
}
