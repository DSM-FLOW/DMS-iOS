import Foundation

public struct OutingTypeEntity: Equatable, Hashable {
    public init(
        titleType: [String]
    ) {
        self.titleType = titleType
    }
    public let titleType: [String]
}
