import Combine
import Foundation
import BaseDomain
import StudentsDomainInterface

public struct RemoteStudentsDataSourceStub: RemoteStudentsDataSource {
    public init() {}

    public func signup(req: SignupRequestDTO) -> AnyPublisher<SignupDmsFeatures, Error> {
        Just(SignupDmsFeatures(
            mealService: true,
            noticeService: true,
            pointService: true,
            studyRoomService: false,
            remainService: false
        ))
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, Error> {
        Just("abcdef@gmail.com").setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }

    public func checkExistGradeClassNumber(
        req: CheckExistGradeClassNumberRequestDTO
    ) -> AnyPublisher<String, Error> {
        Just("김범진").setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, Error> {
        Just(
            MyProfileEntity(
                schoolName: "광주소프트웨어마이스터고등학교",
                name: "변찬우",
                gcn: "2118",
                profileImageURL: URL(string: "https://avatars.githubusercontent.com/u/57276315?v=4"),
                sex: "MALE",
                bonusPoint: 0,
                minusPoint: 24,
                phrase: "벌점이 12점이예요. 더 바른 생활을 위해 노력해주세요!"
            )
        ).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func changeProfileImage(url: String) -> AnyPublisher<Void, Error> {
        Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func withdrawal() -> AnyPublisher<Void, Error> {
        Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
