import Combine

public protocol FetchOutingAvailableTimeUseCase {
    func execute(dayOfWeek: String) -> AnyPublisher<[OutingEntity], Error>
}
