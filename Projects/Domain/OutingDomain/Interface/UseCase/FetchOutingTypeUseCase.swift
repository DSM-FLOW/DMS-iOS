import Combine

public protocol FetchOutingTypeUseCase {
    func execute() -> AnyPublisher<OutingTypeEntity, Error>
}
