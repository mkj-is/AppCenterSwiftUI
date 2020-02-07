import Foundation
import FTAPIKit

struct ReleasesEnpoint: ResponseEndpoint, AuthorizedEndpoint {
    typealias Response = [Release]
    let path: String

    init(ownerName: String, appName: String) {
        self.path = "apps/\(ownerName)/\(appName)/releases"
    }
}
