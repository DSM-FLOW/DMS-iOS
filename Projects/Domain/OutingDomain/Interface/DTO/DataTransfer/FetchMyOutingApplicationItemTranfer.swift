import Combine
import Foundation

public extension MyOutingApplicationItemResponseDTO {
    func toDomain() -> MyOutingApplicationItemEntity {
        return MyOutingApplicationItemEntity(
            id: id,
            date: date,
            titleType: titleType,
            status: status,
            outingTime: outingTime,
            arrivalTime: arrivalTime,
            reason: reason ?? "없음",
            companions: companions
        )
    }
}
