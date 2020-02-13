import FTAPIKit

struct TokenRequest: Encodable {
    let description = "AppCenterSwiftUIClient"
    let scope: [Scope] = [.viewer]
}

struct TokenResponse: Decodable {
    let id, apiToken, description: String
    let scope: [Scope]
    let createdAt: String
}

struct PostTokenEndpoint: RequestResponseEndpoint {
    typealias Response = TokenResponse

    let request = TokenRequest()
    let path = "api_tokens"
}
