import Combine

public protocol OutingApplicationUseCase {
    func execute(req: OutingApplicationRequestDTO) -> AnyPublisher<OutingApplicationEntity, Error>
}
