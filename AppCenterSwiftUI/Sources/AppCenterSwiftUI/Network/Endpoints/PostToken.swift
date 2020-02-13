import FTAPIKit

struct TokenRequest: Encodable {
    let description: String
    let scope: [Scope]
}

struct TokenResponse: Decodable {
    let id, apiToken, description: String
    let scope: [Scope]
    let createdAt: String
}

struct PostTokenEndpoint: RequestResponseEndpoint {
    typealias Response = TokenResponse

    let request: TokenRequest
    let path = "api_tokens"
}
