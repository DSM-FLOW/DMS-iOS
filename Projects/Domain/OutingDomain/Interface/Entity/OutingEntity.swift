import Foundation

public struct OutingEntity: Equatable, Hashable {
    public init(
        outingAvailableTimeId: UUID,
        outingTime: String,
        arrivalTime: String,
        enabled: Bool,
        dayOfWeek: String
    ) {
        self.outingAvailableTimeId = outingAvailableTimeId
        self.outingTime = outingTime
        self.arrivalTime = arrivalTime
        self.enabled = enabled
        self.dayOfWeek = dayOfWeek
    }

    public let outingAvailableTimeId: UUID
    public let outingTime: String
    public let arrivalTime: String
    public let enabled: Bool
    public let dayOfWeek: String
}
