import Foundation

public struct SigninRequestDTO: Encodable {
    public let accountID: String
    public let password: String
    public let deviceToken: String?

    public init(accountID: String, password: String, deviceToken: String?) {
        self.accountID = accountID
        self.password = password
        self.deviceToken = deviceToken
    }

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case password
        case deviceToken = "device_token"
    }
}
