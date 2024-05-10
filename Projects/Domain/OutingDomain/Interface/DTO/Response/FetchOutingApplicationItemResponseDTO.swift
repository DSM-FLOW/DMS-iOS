import Foundation

public struct MyOutingApplicationItemResponseDTO: Decodable {
    public let id: UUID
    public let date: String
    public let titleType: String
    public let status: String
    public let outingTime: String
    public let arrivalTime: String
    public let reason: String?
    public let companions: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case date = "outing_date"
        case titleType = "outing_type_title"
        case status
        case outingTime = "outing_time"
        case arrivalTime = "arrival_time"
        case reason
        case companions = "outing_companions"
    }
}
