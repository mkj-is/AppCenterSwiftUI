import FTAPIKit

struct UserEndpoint: ResponseEndpoint, AuthorizedEndpoint {
    typealias Response = User
    let authorized = true
    let path = "user"
}
