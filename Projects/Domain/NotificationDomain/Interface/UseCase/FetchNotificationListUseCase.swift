import Combine

public protocol FetchNotificationListUseCase {
    func execute() -> AnyPublisher<Void, Error>
}
