import Foundation

public struct OutingApplicationRequestDTO: Encodable {
    public let outingDate: String
    public let outingTime: String
    public let arrivalTime: String
    public let outingTypeTitle: String
    public let reason: String
    public let companionIds: [String]

    public init(
        outingDate: String,
        outingTime: String,
        arrivalTime: String,
        outingTypeTitle: String,
        reason: String,
        companionIds: [String]
    ) {
        self.outingDate = outingDate
        self.outingTime = outingTime
        self.arrivalTime = arrivalTime
        self.outingTypeTitle = outingTypeTitle
        self.reason = reason
        self.companionIds = companionIds
    }

    enum CodingKeys: String, CodingKey {
        case outingDate = "outing_date"
        case outingTime = "outing_time"
        case arrivalTime = "arrival_time"
        case outingTypeTitle = "outing_type_title"
        case reason
        case companionIds = "companion_ids"
    }
}
