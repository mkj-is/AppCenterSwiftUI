import Foundation
import FTAPIKit

protocol APIServer {
    var baseUri: URL { get }
    var urlSession: URLSession { get }
    var jsonDecoder: JSONDecoder { get }
    var jsonEncoder: JSONEncoder { get }
    var errorType: APIError.Type { get }
}
