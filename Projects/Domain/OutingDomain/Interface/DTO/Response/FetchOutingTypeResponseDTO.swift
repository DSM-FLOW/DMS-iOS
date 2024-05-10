import Foundation

public struct FetchOutingTypeResponseDTO: Decodable {
    public let titleType: [String]

    enum CodingKeys: String, CodingKey {
        case titleType = "titles"
    }
}
