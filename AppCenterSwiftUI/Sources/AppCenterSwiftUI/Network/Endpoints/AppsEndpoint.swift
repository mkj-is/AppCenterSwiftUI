import Foundation
import FTAPIKit

struct AppsEndpoint: ResponseEndpoint {
    typealias Response = [App]

    let authorized = true
    let path = "apps"
    let parameters = [
        "$orderBy": "display_name"
    ]
}
