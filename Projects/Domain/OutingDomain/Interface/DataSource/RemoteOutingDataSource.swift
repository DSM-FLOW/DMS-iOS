import Combine

public protocol RemoteOutingDataSource {
    func fetchMyOutingApplicationItem() -> AnyPublisher<MyOutingApplicationItemEntity, Error>
    func fetchOutingAvailableTime(dayOfWeek: String) -> AnyPublisher<[OutingEntity], Error>
    func fetchOutingType() -> AnyPublisher<OutingTypeEntity, Error>
}
