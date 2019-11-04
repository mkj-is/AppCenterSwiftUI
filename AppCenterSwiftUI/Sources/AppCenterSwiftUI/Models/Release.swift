import Foundation

struct Release: Decodable, Identifiable, Equatable {
    let origin: Origin?
    let id: UInt
    let shortVersion, version: String
    let uploadedAt: Date
    let enabled: Bool
    let destinations: [Destination]?
    let build: Build?

    static func == (lhs: Release, rhs: Release) -> Bool {
        lhs.id == rhs.id
    }
}

struct Destination: Decodable {
    let id: String
    let isLatest: Bool?
    let type: DistributionStore?
    let publishingStatus: String?
    let destinationType: DestinationType?
    let name, displayName: String?
}

struct Build: Decodable {
    let branchName, commitHash, commitMessage: String
}
