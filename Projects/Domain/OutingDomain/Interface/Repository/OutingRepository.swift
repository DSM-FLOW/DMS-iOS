import Combine

public protocol OutingRepository {
    func fetchMyOutingApplicationItem() -> AnyPublisher<MyOutingApplicationItemEntity, Error>
    func fetchOutingAvailableTime(dayOfWeek: String) -> AnyPublisher<[OutingEntity], Error>
}
