import Combine
import StudentsDomainInterface

public struct FetchAllStudentUseCaseImpl: FetchAllStudentUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(name: String?) -> AnyPublisher<[AllStudentEntity], Error> {
        studentsRepository.fetchAllStudent(name: name)
    }
}
