import Foundation

public struct MyOutingApplicationItemEntity: Equatable, Hashable {
    public init(
        id: UUID,
        date: String,
        titleType: String,
        status: String,
        outingTime: String,
        arrivalTime: String,
        reason: String?,
        companions: [String]
    ) {
        self.id = id
        self.date = date
        self.titleType = titleType
        self.status = status
        self.outingTime = outingTime
        self.arrivalTime = arrivalTime
        self.reason = reason
        self.companions = companions
    }

    public let id: UUID
    public let date: String
    public let titleType: String
    public let status: String
    public let outingTime: String
    public let arrivalTime: String
    public let reason: String?
    public let companions: [String]
}
