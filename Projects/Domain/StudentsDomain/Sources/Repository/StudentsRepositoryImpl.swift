import StudentsDomainInterface
import Combine

public struct StudentsRepositoryImpl: StudentsRepository {
    private let remoteStudentsDataSource: any RemoteStudentsDataSource

    public init(remoteStudentsDataSource: any RemoteStudentsDataSource) {
        self.remoteStudentsDataSource = remoteStudentsDataSource
    }

    public func signup(req: SignupRequestDTO) -> AnyPublisher<SignupDmsFeatures, Error> {
        remoteStudentsDataSource.signup(req: req)
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.checkDuplicateAccountID(id: id)
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.checkDuplicateEmail(email: email)
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.renewalPassword(req: req)
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, Error> {
        remoteStudentsDataSource.findID(req: req)
    }

    public func checkExistGradeClassNumber(
        req: CheckExistGradeClassNumberRequestDTO
    ) -> AnyPublisher<String, Error> {
        remoteStudentsDataSource.checkExistGradeClassNumber(req: req)
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, Error> {
        remoteStudentsDataSource.fetchMyProfile()
    }

    public func changeProfileImage(url: String) -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.changeProfileImage(url: url)
    }

    public func withdrawal() -> AnyPublisher<Void, Error> {
        remoteStudentsDataSource.withdrawal()
    }

    public func fetchAllStudents(name: String?) -> AnyPublisher<[StudentEntity], Error> {
        remoteStudentsDataSource.fetchAllStudents(name: name)
    }
}
