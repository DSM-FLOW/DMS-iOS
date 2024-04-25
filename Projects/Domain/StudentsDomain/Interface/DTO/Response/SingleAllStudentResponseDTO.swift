import Foundation

public struct SingleAllStudentResponseDTO: Decodable {
    public let id: UUID
    public let name: String
    public let gradeClassNumber: String
    public let profileImageURL: URL

    enum CodingKeys: String, CodingKey {
        case id, name
        case gradeClassNumber = "gcn"
        case profileImageURL = "profile_image_url"
    }
}
