import Combine
import Foundation

public extension FetchAllStudentResponseDTO {
    func toDomain() -> [AllStudentEntity] {
        students.map { $0.toDomain() }
    }
}

public extension SingleAllStudentResponseDTO {
    func toDomain() -> AllStudentEntity {
        AllStudentEntity(
            id: id,
            name: name,
            gradeClassNumber: gradeClassNumber,
            profileImageURL: profileImageURL
        )
    }
}
