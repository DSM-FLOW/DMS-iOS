import Foundation

public struct OutingEntity: Equatable, Hashable {
    public init(
        id: UUID,
        outingTime: String,
        arrivalTime: String,
        enabled: Bool,
        dayOfWeek: String
    ) {
        self.id = id
        self.outingTime = outingTime
        self.arrivalTime = arrivalTime
        self.enabled = enabled
        self.dayOfWeek = dayOfWeek
    }

    public let id: UUID
    public let outingTime: String
    public let arrivalTime: String
    public let enabled: Bool
    public let dayOfWeek: String
}
