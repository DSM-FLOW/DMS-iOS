import Foundation

public struct FetchOutingAvailableTimeListResponseDTO: Decodable {
    public let outingAvailableTimes: [SingleOutingAvailableTimeResponseDTO]

    enum CodingKeys: String, CodingKey {
        case outingAvailableTimes = "outing_available_times"
    }
}
