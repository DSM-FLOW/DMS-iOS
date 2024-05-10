import Combine
import Foundation

public extension OutingApplicationResponseDTO {
    func toDomain() -> OutingApplicationEntity {
        OutingApplicationEntity(id: id)
    }
}
