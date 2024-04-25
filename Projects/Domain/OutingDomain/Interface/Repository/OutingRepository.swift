import Combine

public protocol OutingRepository {
    func fetchMyOutingApplicationItem() -> AnyPublisher<MyOutingApplicationItemEntity, Error>
}
