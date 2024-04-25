import Combine

public protocol FetchAllStudentUseCase {
    func execute(name: String?) -> AnyPublisher<[AllStudentEntity], Error>
}
