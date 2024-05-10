import Combine

public protocol FetchMyOutingApplicationItemUseCase {
    func execute() -> AnyPublisher<MyOutingApplicationItemEntity, Error>
}
