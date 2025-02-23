import Combine
import StudentsDomainInterface

public struct CheckDuplicateAccountIDUseCaseImpl: CheckDuplicateAccountIDUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(id: String) -> AnyPublisher<Void, Error> {
        studentsRepository.checkDuplicateAccountID(id: id)
    }
}
