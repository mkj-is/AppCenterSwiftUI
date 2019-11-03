import Foundation
import FTAPIKit

struct AppsEndpoint: APIResponseEndpoint {
    typealias Response = [App]
    let authorized = true
    let path = "apps"
    var type: RequestType = .urlQuery
    let parameters = [
        "$orderBy": "display_name"
    ]
}
