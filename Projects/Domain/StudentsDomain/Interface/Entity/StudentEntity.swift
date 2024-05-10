import Foundation

public struct StudentEntity: Equatable, Hashable {
    public init(
        id: UUID,
        name: String,
        gradeClassNumber: String,
        profileImageURL: URL
    ) {
        self.id = id
        self.name = name
        self.gradeClassNumber = gradeClassNumber
        self.profileImageURL = profileImageURL
    }

    public let id: UUID
    public let name: String
    public let gradeClassNumber: String
    public let profileImageURL: URL
}
