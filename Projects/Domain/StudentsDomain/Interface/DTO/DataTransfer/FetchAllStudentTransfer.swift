import Combine
import Foundation

public extension FetchAllStudentsResponseDTO {
    func toDomain() -> [StudentEntity] {
        students.map { $0.toDomain() }
    }
}

public extension StudentResponseDTO {
    func toDomain() -> StudentEntity {
        StudentEntity(
            id: id,
            name: name,
            gradeClassNumber: gradeClassNumber,
            profileImageURL: profileImageURL
        )
    }
}
