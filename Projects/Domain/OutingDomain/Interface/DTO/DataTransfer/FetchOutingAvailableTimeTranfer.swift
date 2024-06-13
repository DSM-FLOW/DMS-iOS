import Combine
import Foundation

public extension FetchOutingAvailableTimeListResponseDTO {
    func toDomain() -> [OutingEntity] {
        times.map { $0.toDomain() }
    }
}

public extension SingleOutingAvailableTimeResponseDTO {
    func toDomain() -> OutingEntity {
        OutingEntity(
            id: id,
            schoolId: schoolId,
            outingTime: outingTime,
            arrivalTime: arrivalTime,
            enabled: enabled,
            dayOfWeek: dayOfWeek
        )
    }
}
