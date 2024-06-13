import Foundation

public struct SingleOutingAvailableTimeResponseDTO: Decodable {
    public let id: UUID
    public let schoolId: UUID
    public let outingTime: String
    public let arrivalTime: String
    public let enabled: Bool
    public let dayOfWeek: String

    enum CodingKeys: String, CodingKey {
        case id, enabled
        case schoolId = "school_id"
        case outingTime = "outing_time"
        case arrivalTime = "arrival_time"
        case dayOfWeek = "day_of_week"
    }
}
