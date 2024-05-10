import Combine
import OutingDomainInterface

public struct OutingApplicationUseCaseImpl: OutingApplicationUseCase {
    private let outingRepository: any OutingRepository

    public init(outingRepository: any OutingRepository) {
        self.outingRepository = outingRepository
    }

    public func execute(req: OutingApplicationRequestDTO) -> AnyPublisher<OutingApplicationEntity, Error> {
        outingRepository.outingApplication(req: req)
    }
}
