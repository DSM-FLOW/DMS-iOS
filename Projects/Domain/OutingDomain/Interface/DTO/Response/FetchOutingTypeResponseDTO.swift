import Foundation

public struct FetchOutingTypeResponseDTO: Decodable {
    public let outingTypeTitle: [String]

    enum CodingKeys: String, CodingKey {
        case outingTypeTitle = "titles"
    }
}
