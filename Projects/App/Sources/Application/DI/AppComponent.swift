import NeedleFoundation
import SwiftUI
import Keychain
import SignupFeature
import SignupFeatureInterface
import RootFeature
import FindIDFeature
import FindIDFeatureInterface
import SigninFeature
import SigninFeatureInterface
import RenewalPasswordFeature
import RenewalPasswordFeatureInterface
import MainTabFeature
import MainTabFeatureInterface
import HomeFeature
import HomeFeatureInterface
import ApplyFeature
import ApplyFeatureInterface
import StudyRoomFeature
import StudyRoomFeatureInterface
import RemainApplyFeature
import RemainApplyFeatureInterface
import OutingApplyFeature
import OutingApplyFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import NoticeFeature
import NoticeFeatureInterface
import SplashFeature
import SplashFeatureInterface

public final class AppComponent: BootstrapComponent {
    private let _keychain: any Keychain

    init(keychain: any Keychain) {
        self._keychain = keychain
    }

    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var keychain: any Keychain {
        shared {
            _keychain
        }
    }

    var rootComponent: RootComponent {
        shared {
            RootComponent(parent: self)
        }
    }
}

// MARK: - Auth
public extension AppComponent {
    var schoolCodeFactory: any SchoolCodeFactory {
        SchoolCodeComponent(parent: self)
    }
    var findIDFactory: any FindIDFactory {
        FindIDComponent(parent: self)
    }
    var signinFactory: any SigninFactory {
        SigninComponent(parent: self)
    }
    var splashFactory: any SplashFactory {
        SplashComponent(parent: self)
    }
    var schoolConfirmationQuestionsFactory: any SchoolConfirmationQuestionsFactory {
        SchoolConfirmationQuestionsComponent(parent: self)
    }
    var signupEmailVerifyFactory: any SignupEmailVerifyFactory {
        SignupEmailVerifyComponent(parent: self)
    }
    var signupEmailAuthCodeVerifyFactory: any SignupEmailAuthCodeVerifyFactory {
        SignupEmailAuthCodeVerifyComponent(parent: self)
    }
    var idSettingFactory: any IDSettingFactory {
        IDSettingComponent(parent: self)
    }
    var enterInformationFactory: any EnterInformationFactory {
        EnterInformationComponent(parent: self)
    }
    var authenticationEmailFactory: any AuthenticationEmailFactory {
        AuthenticationEmailComponent(parent: self)
    }
    var changePasswordFactory: any ChangePasswordFactory {
        ChangePasswordComponent(parent: self)
    }
    var signupProfileImageFactory: any SignupProfileImageFactory {
        SignupProfileImageComponent(parent: self)
    }
    var signupPasswordFactory: any SignupPasswordFactory {
        SignupPasswordComponent(parent: self)
    }
    var signupTermsFactory: any SignupTermsFactory {
        SignupTermsComponent(parent: self)
    }
}

// MARK: - Main
public extension AppComponent {
    var mainTabFactory: any MainTabFactory {
        MainTabComponent(parent: self)
    }
    var homeFactory: any HomeFactory {
        HomeComponent(parent: self)
    }
    var alarmFactory: any AlarmFactory {
        AlarmComponent(parent: self)
    }
    var studyRoomDetailFactory: any StudyRoomDetailFactory {
        StudyRoomDetailComponent(parent: self)
    }
    var noticeListFactory: any NoticeListFactory {
        NoticeListComponent(parent: self)
    }
    var myPageFactory: any MyPageFactory {
        MyPageComponent(parent: self)
    }
    var changeProfileFactory: any ChangeProfileFactory {
        ChangeProfileComponent(parent: self)
    }
    var noticeDetailFactory: any NoticeDetailFactory {
        NoticeDetailComponent(parent: self)
    }
    var rewardPointDetailFactory: any RewardPointDetailFactory {
        RewardPointDetailComponent(parent: self)
    }
    var checkPasswordFactory: any CheckPasswordFactory {
        CheckPasswordComponent(parent: self)
    }
    var modifyPasswordFactory: any ModifyPasswordFactory {
        ModifyPasswordComponent(parent: self)
    }
    var setNotificationFactory: any SetNotificationFactory {
        SetNotificationComponent(parent: self)
    }
    var studyRoomListFactory: any StudyRoomListFactory {
        StudyRoomListComponent(parent: self)
    }
    var applyPageFactory: any ApplyPageFactory {
        ApplyPageComponent(parent: self)
    }
    var remainApplyFactory: any RemainApplyFactory {
        RemainApplyComponent(parent: self)
    }
    var outingApplyFactory: any OutingApplyFactory {
        OutingApplyComponent(parent: self)
    }
}
