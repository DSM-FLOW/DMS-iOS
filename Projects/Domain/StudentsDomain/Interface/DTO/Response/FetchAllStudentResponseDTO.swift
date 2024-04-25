import Foundation

public struct FetchAllStudentResponseDTO: Decodable {
    public let students: [SingleAllStudentResponseDTO]

    enum CodingKeys: String, CodingKey {
        case students
    }
}
