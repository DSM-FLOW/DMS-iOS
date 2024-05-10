import Foundation

public struct OutingApplicationRequestDTO: Encodable {
    public let date: String
    public let outingTime: String
    public let arrivalTime: String
    public let titleType: String
    public let reason: String
    public let companionIds: [String]

    public init(
        date: String,
        outingTime: String,
        arrivalTime: String,
        titleType: String,
        reason: String,
        companionIds: [String]
    ) {
        self.date = date
        self.outingTime = outingTime
        self.arrivalTime = arrivalTime
        self.titleType = titleType
        self.reason = reason
        self.companionIds = companionIds
    }

    enum CodingKeys: String, CodingKey {
        case date = "outing_date"
        case outingTime = "outing_time"
        case arrivalTime = "arrival_time"
        case titleType = "outing_type_title"
        case reason
        case companionIds = "companion_ids"
    }
}
