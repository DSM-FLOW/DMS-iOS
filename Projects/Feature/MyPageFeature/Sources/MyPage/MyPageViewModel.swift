import BaseFeature
import AuthDomainInterface
import Combine
import StudentsDomainInterface

final class MyPageViewModel: BaseViewModel {
    @Published var profile: MyProfileEntity?
    @Published var isPresentedLogoutAlert = false
    @Published var isNavigateChangeProfile = false
    @Published var isNavigateChangePassword = false
    @Published var isNavigateRewardPointDetail = false
    @Published var isNavigateSetNotifcation = false
    @Published var isNavigateBugReport = false
    @Published var isPresentedWithdrawalAlert = false
    @Published var isSuccessLogout = false
    @Published var sexType: SexType?

    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    private let logoutUseCase: any LogoutUseCase
    private let withdrawalUseCase: any WithdrawalUseCase

    public init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase,
        logoutUseCase: any LogoutUseCase,
        withdrawalUseCase: any WithdrawalUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        self.logoutUseCase = logoutUseCase
        self.withdrawalUseCase = withdrawalUseCase
    }

    func onAppear() {
        addCancellable(
            fetchMyProfileUseCase.execute()
        ) { [weak self] profile in
            self?.profile = profile
            self?.convertSexType()
        }
    }

    func convertSexType() {
        switch self.profile?.sex {
        case "MALE":
            sexType = .male
        case "FEMALE":
            sexType = .female
        default:
            break
        }
    }

    func logoutButtonDidTap() {
        isPresentedLogoutAlert = true
    }

    func confirmLogoutButtonDidTap() {
        logoutUseCase.execute()
        isSuccessLogout = true
    }

    func profileImageDidTap() {
        isNavigateChangeProfile = true
    }

    func withdrawalButtonDidTap() {
        isPresentedWithdrawalAlert = true
    }

    func confirmWithdrawalButtonDidTap() {
        addCancellable(withdrawalUseCase.execute()) { [weak self] _ in
            self?.isSuccessLogout = true
        }
    }

    func refresh() {
        addCancellable(
            fetchMyProfileUseCase.execute()
        ) { [weak self] profile in
            self?.profile = profile
            self?.convertSexType()
        }
    }

    enum SexType: String {
        case male = "남"
        case female = "여"
    }
}
