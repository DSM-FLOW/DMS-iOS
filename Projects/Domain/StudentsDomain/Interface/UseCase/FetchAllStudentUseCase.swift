import Combine

public protocol FetchAllStudentsUseCase {
    func execute(name: String?) -> AnyPublisher<[StudentEntity], Error>
}
