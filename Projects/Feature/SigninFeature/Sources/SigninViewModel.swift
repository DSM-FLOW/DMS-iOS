import BaseFeature
import Combine
import AuthDomainInterface
import FirebaseMessaging

final class SigninViewModel: BaseViewModel {
    @Published var id = ""
    @Published var password = ""
    @Published var isOnAutoSignin = true
    @Published var isSuccessSignin = false
    @Published var dmsFeatures: DmsFeatures?

    var isSigninEnabled: Bool {
        !id.isEmpty && !password.isEmpty
    }

    private let signinUseCase: any SigninUseCase

    public init(
        signinUseCase: any SigninUseCase
    ) {
        self.signinUseCase = signinUseCase
    }

    func signinButtonDidTap() {
        guard isSigninEnabled else { return }
        addCancellable(
            signinUseCase.execute(
                req: .init(
                    accountID: id,
                    password: password,
                    deviceToken: Messaging.messaging().fcmToken
                )
            )
        ) { [weak self] feature in
            self?.dmsFeatures = DmsFeatures(
                mealService: feature.mealService,
                noticeService: feature.noticeService,
                pointService: feature.pointService,
                studyRoomService: feature.studyRoomService,
                remainService: feature.remainService
            )
            self?.isSuccessSignin = true
        }
    }
}
