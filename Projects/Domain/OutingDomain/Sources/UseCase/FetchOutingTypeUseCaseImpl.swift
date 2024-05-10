import Combine
import OutingDomainInterface

public struct FetchOutingTypeUseCaseImpl: FetchOutingTypeUseCase {
    private let outingRepository: any OutingRepository

    public init(outingRepository: any OutingRepository) {
        self.outingRepository = outingRepository
    }

    public func execute() -> AnyPublisher<OutingTypeEntity, Error> {
        outingRepository.fetchOutingType()
    }
}
