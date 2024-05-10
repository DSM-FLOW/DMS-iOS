import Foundation

public struct FetchAllStudentsResponseDTO: Decodable {
    public let students: [StudentResponseDTO]

    enum CodingKeys: String, CodingKey {
        case students
    }
}
