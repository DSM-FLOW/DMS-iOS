import Foundation

public struct OutingTypeEntity: Equatable, Hashable {
    public init(
        outingTypeTitle: [String]
    ) {
        self.outingTypeTitle = outingTypeTitle
    }
    public let outingTypeTitle: [String]
}
