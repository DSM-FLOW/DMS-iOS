import Combine
import Foundation

public extension FetchOutingTypeResponseDTO {
    func toDomain() -> OutingTypeEntity {
        OutingTypeEntity(
            titleType: titleType
        )
    }
}
