import Combine
import OutingDomainInterface

public struct FetchOutingAvailableTimeUseCaseImpl: FetchOutingAvailableTimeUseCase {
    private let outingRepository: any OutingRepository

    public init(outingRepository: any OutingRepository) {
        self.outingRepository = outingRepository
    }

    public func execute(dayOfWeek: String) -> AnyPublisher<[OutingEntity], Error> {
        outingRepository.fetchOutingAvailableTime(dayOfWeek: dayOfWeek)
    }
}
