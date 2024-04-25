import Combine

public protocol RemoteStudentsDataSource {
    func signup(req: SignupRequestDTO) -> AnyPublisher<SignupDmsFeatures, Error>
    func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, Error>
    func checkDuplicateEmail(email: String) -> AnyPublisher<Void, Error>
    func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
    func findID(req: FindIDRequestDTO) -> AnyPublisher<String, Error>
    func checkExistGradeClassNumber(req: CheckExistGradeClassNumberRequestDTO) -> AnyPublisher<String, Error>
    func fetchMyProfile() -> AnyPublisher<MyProfileEntity, Error>
    func changeProfileImage(url: String) -> AnyPublisher<Void, Error>
    func withdrawal() -> AnyPublisher<Void, Error>
    func fetchAllStudent(name: String?) -> AnyPublisher<[AllStudentEntity], Error>
}
