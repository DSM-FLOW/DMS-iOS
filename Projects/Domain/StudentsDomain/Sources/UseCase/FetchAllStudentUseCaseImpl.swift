import Combine
import StudentsDomainInterface

public struct FetchAllStudentsUseCaseImpl: FetchAllStudentsUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(name: String?) -> AnyPublisher<[StudentEntity], Error> {
        studentsRepository.fetchAllStudents(name: name)
    }
}
