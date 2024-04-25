import Foundation

public struct SingleOutingAvailableTimeResponseDTO: Decodable {
    public let outingAvailableTimeId: UUID
    public let outingTime: String
    public let arrivalTime: String
    public let enabled: Bool
    public let dayOfWeek: String

    enum CodingKeys: String, CodingKey {
        case outingAvailableTimeId = "outing_available_time_id"
        case outingTime = "outing_time"
        case arrivalTime = "arrival_time"
        case enabled
        case dayOfWeek = "day_of_week"
    }
}
