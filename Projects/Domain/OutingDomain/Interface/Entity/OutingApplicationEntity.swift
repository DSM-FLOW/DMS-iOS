import Foundation

public struct OutingApplicationEntity: Equatable, Hashable {
    public init(
        id: UUID
    ) {
        self.id = id
    }
    public let id: UUID
}
