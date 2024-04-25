import Combine
import Foundation

public extension FetchOutingAvailableTimeListResponseDTO {
    func toDomain() -> [OutingEntity] {
        outingAvailableTimes.map { $0.toDomain() }
    }
}

public extension SingleOutingAvailableTimeResponseDTO {
    func toDomain() -> OutingEntity {
        OutingEntity(
            outingAvailableTimeId: outingAvailableTimeId,
            outingTime: outingTime,
            arrivalTime: arrivalTime,
            enabled: enabled,
            dayOfWeek: dayOfWeek
        )
    }
}
