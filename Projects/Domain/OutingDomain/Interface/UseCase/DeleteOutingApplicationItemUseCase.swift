import Combine

public protocol DeleteOutingApplicationItemUseCase {
    func execute(id: String) -> AnyPublisher<Void, Error>
}
