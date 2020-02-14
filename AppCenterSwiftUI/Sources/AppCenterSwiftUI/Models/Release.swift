import Foundation

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

struct DistributionGroup: Decodable {
    let id, name: String
}

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

struct ReleaseDetail: Decodable, Identifiable, Equatable {
    let id: Int
    let appName, appDisplayName, version, shortVersion: String
    let appOs, releaseNotes: String?
    let origin: Origin?
    let provisioningProfileName: String?
    let provisioningProfileType: ProvisioningProfileType?
    let provisioningProfileExpiryDate: Date?
    let isProvisioningProfileSyncing: Bool?
    let size: Int?
    let minOS, deviceFamily, androidMinApiLevel, bundleIdentifier: String?
    let packageHashes: [String]?
    let fingerprint: String?
    let uploadedAt: Date?
    let downloadUrl, appIconUrl, installUrl: URL?
    let destinations: [Destination]?
    let isUdidProvisioned, canResign: Bool?
    let build: Build?
    let enabled: Bool
    let status: String?
    let isExternalBuild: Bool

    static func == (lhs: ReleaseDetail, rhs: ReleaseDetail) -> Bool {
        lhs.id == rhs.id
    }
}
