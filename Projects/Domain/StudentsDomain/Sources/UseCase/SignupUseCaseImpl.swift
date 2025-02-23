import Combine
import StudentsDomainInterface

public struct SignupUseCaseImpl: SignupUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: SignupRequestDTO) -> AnyPublisher<SignupDmsFeatures, Error> {
        studentsRepository.signup(req: req)
    }
}
