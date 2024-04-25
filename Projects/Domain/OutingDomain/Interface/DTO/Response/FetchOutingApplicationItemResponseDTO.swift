import Foundation

public struct MyOutingApplicationItemResponseDTO: Decodable {
    public let id: UUID
    public let outingDate: String
    public let outingTypeTitle: String
    public let status: String
    public let outingTime: String
    public let arrivalTime: String
    public let reason: String?
    public let outingCompanions: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case outingDate = "outing_date"
        case outingTypeTitle = "outing_type_title"
        case status
        case outingTime = "outing_time"
        case arrivalTime = "arrival_time"
        case reason
        case outingCompanions = "outing_companions"
    }
}
