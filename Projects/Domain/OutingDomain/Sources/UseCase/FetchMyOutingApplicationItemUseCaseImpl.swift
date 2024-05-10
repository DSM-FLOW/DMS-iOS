import Combine
import OutingDomainInterface

public struct FetchMyOutingApplicationItemUseCaseImpl: FetchMyOutingApplicationItemUseCase {
    private let outingRepository: any OutingRepository

    public init(outingRepository: any OutingRepository) {
        self.outingRepository = outingRepository
    }

    public func execute() -> AnyPublisher<MyOutingApplicationItemEntity, Error> {
        outingRepository.fetchMyOutingApplicationItem()
    }
}
