import Combine

public protocol RemoteOutingDataSource {
    func fetchMyOutingApplicationItem() -> AnyPublisher<MyOutingApplicationItemEntity, Error>
}
