import FTAPIKit

struct ReleaseEnpoint: ResponseEndpoint {
    typealias Response = ReleaseDetail
    let path: String

    init(ownerName: String, appName: String, releaseId: UInt) {
        self.path = "apps/\(ownerName)/\(appName)/releases/\(releaseId)"
    }
}

