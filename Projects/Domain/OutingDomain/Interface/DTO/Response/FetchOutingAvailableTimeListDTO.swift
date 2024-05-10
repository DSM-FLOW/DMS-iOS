import Foundation

public struct FetchOutingAvailableTimeListResponseDTO: Decodable {
    public let times: [SingleOutingAvailableTimeResponseDTO]

    enum CodingKeys: String, CodingKey {
        case times = "outing_available_times"
    }
}
