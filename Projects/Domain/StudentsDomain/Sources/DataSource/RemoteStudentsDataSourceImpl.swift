import BaseDomain
import StudentsDomainInterface
import Combine

public final class RemoteStudentsDataSourceImpl: BaseRemoteDataSource<StudentsAPI>, RemoteStudentsDataSource {
    public func signup(req: SignupRequestDTO) -> AnyPublisher<SignupDmsFeatures, Error> {
        request(.signup(req), dto: SignupDmsFeaturesResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, Error> {
        request(.checkDuplicateAccountID(id: id))
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, Error> {
        request(.checkDuplicateEmail(email: email))
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        request(.renewalPassword(req))
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, Error> {
        request(.findID(req), dto: FindIDResponseDTO.self)
            .map(\.email)
            .eraseToAnyPublisher()
    }

    public func checkExistGradeClassNumber(
        req: CheckExistGradeClassNumberRequestDTO
    ) -> AnyPublisher<String, Error> {
        request(.checkExistGradeClassNumber(req), dto: CheckExistGradeClassNumberResponseDTO.self)
            .map(\.name)
            .eraseToAnyPublisher()
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, Error> {
        request(.fetchMyProfile, dto: FetchMyProfileResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func changeProfileImage(url: String) -> AnyPublisher<Void, Error> {
        request(.changeProfileImage(url: url))
    }

    public func withdrawal() -> AnyPublisher<Void, Error> {
        request(.withdrawal)
    }

    public func fetchAllStudents(name: String?) -> AnyPublisher<[StudentEntity], Error> {
        request(.fetchAllStudents(name: name), dto: FetchAllStudentsResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
