import Foundation

public struct MyOutingApplicationItemEntity: Equatable, Hashable {
    public init(
        id: UUID,
        outingDate: String,
        outingTypeTitle: String,
        status: String,
        outingTime: String,
        arrivalTime: String,
        reason: String?,
        outingCompanions: [String]
    ) {
        self.id = id
        self.outingDate = outingDate
        self.outingTypeTitle = outingTypeTitle
        self.status = status
        self.outingTime = outingTime
        self.arrivalTime = arrivalTime
        self.reason = reason
        self.outingCompanions = outingCompanions
    }

    public let id: UUID
    public let outingDate: String
    public let outingTypeTitle: String
    public let status: String
    public let outingTime: String
    public let arrivalTime: String
    public let reason: String?
    public let outingCompanions: [String]
}
