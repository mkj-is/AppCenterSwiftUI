import Foundation
import FTAPIKit

struct ReleasesEnpoint: ResponseEndpoint {
    typealias Response = [Release]

    let path: String

    init(ownerName: String, appName: String) {
        self.path = "apps/\(ownerName)/\(appName)/releases"
    }
}
