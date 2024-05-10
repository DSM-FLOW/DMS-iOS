import Foundation

public struct OutingApplicationResponseDTO: Decodable {
    public let id: UUID

    enum CodingKeys: String, CodingKey {
        case id = "outing_application_id"
    }
}
