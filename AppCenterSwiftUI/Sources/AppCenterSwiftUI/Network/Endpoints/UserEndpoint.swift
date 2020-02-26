import FTAPIKit

struct UserEndpoint: ResponseEndpoint {
    typealias Response = User

    let authorized = true
    let path = "user"
}
