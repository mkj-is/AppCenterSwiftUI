import FTAPIKit

struct UserEndpoint: APIResponseEndpoint {
    typealias Response = User
    let authorized = true
    let path = "user"
}
