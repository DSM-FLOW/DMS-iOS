import Combine
import OutingDomainInterface

public struct DeleteOutingApplicationItemUseCaseImpl: DeleteOutingApplicationItemUseCase {
    private let outingRepository: any OutingRepository

    public init(outingRepository: any OutingRepository) {
        self.outingRepository = outingRepository
    }

    public func execute(id: String) -> AnyPublisher<Void, Error> {
        outingRepository.deleteOutingApplicationItem(id: id)
    }
}
