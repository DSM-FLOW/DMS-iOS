import Combine
import Foundation

public extension MyOutingApplicationItemResponseDTO {
    func toDomain() -> MyOutingApplicationItemEntity {
        return MyOutingApplicationItemEntity(
            id: id,
            outingDate: outingDate,
            outingTypeTitle: outingTypeTitle,
            status: status,
            outingTime: outingTime,
            arrivalTime: arrivalTime,
            reason: reason ?? "없음",
            outingCompanions: outingCompanions
        )
    }
}
