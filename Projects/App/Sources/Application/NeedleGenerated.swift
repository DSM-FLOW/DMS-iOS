

import ApplyFeature
import ApplyFeatureInterface
import AuthDomain
import AuthDomainInterface
import BaseFeature
import DesignSystem
import FilesDomain
import FilesDomainInterface
import FindIDFeature
import FindIDFeatureInterface
import Foundation
import HomeFeature
import HomeFeatureInterface
import Keychain
import MainTabFeature
import MainTabFeatureInterface
import MealDomain
import MealDomainInterface
import MyPageFeature
import MyPageFeatureInterface
import NeedleFoundation
import NoticeDomain
import NoticeDomainInterface
import NoticeFeature
import NoticeFeatureInterface
import NotificationDomain
import NotificationDomainInterface
import OutingApplyFeature
import OutingApplyFeatureInterface
import OutingDomain
import OutingDomainInterface
import PointsDomain
import PointsDomainInterface
import RemainApplyFeature
import RemainApplyFeatureInterface
import RemainsDomain
import RemainsDomainInterface
import RenewalPasswordFeature
import RenewalPasswordFeatureInterface
import RootFeature
import SchoolDomain
import SchoolDomainInterface
import SigninFeature
import SigninFeatureInterface
import SignupFeature
import SignupFeatureInterface
import SplashFeature
import SplashFeatureInterface
import StudentsDomain
import StudentsDomainInterface
import StudyRoomFeature
import StudyRoomFeatureInterface
import StudyRoomsDomain
import StudyRoomsDomainInterface
import SwiftUI
import UsersDomain
import UsersDomainInterface

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var reissueTokenUseCase: any ReissueTokenUseCase {
        return appComponent.reissueTokenUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}
private class SchoolConfirmationQuestionsDependency3fa2ccd12da7c7f5cfc1Provider: SchoolConfirmationQuestionsDependency {
    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase {
        return appComponent.checkSchoolQuestionUseCase
    }
    var fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase {
        return appComponent.fetchSchoolQuestionUseCase
    }
    var signupEmailVerifyFactory: any SignupEmailVerifyFactory {
        return appComponent.signupEmailVerifyFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SchoolConfirmationQuestionsComponent
private func factoryd462667f0418a53210fcf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SchoolConfirmationQuestionsDependency3fa2ccd12da7c7f5cfc1Provider(appComponent: parent1(component) as! AppComponent)
}
private class SchoolCodeDependencyc0114744c1c8c7843672Provider: SchoolCodeDependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase {
        return appComponent.checkSchoolCodeUseCase
    }
    var schoolConfirmationQuestionsFactory: any SchoolConfirmationQuestionsFactory {
        return appComponent.schoolConfirmationQuestionsFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SchoolCodeComponent
private func factoryb65c1efbf06b87162473f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SchoolCodeDependencyc0114744c1c8c7843672Provider(appComponent: parent1(component) as! AppComponent)
}
private class IDSettingDependency8007dfdeec0db237b896Provider: IDSettingDependency {
    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase {
        return appComponent.checkExistGradeClassNumberUseCase
    }
    var checkDuplicateAccountIDUseCase: any CheckDuplicateAccountIDUseCase {
        return appComponent.checkDuplicateAccountIDUseCase
    }
    var signupPasswordFactory: any SignupPasswordFactory {
        return appComponent.signupPasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->IDSettingComponent
private func factory8b3573203ea51120dc5af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return IDSettingDependency8007dfdeec0db237b896Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupPasswordDependency778bf5389a70d7df6152Provider: SignupPasswordDependency {
    var signupProfileImageFactory: any SignupProfileImageFactory {
        return appComponent.signupProfileImageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupPasswordComponent
private func factorye93d1d56840ff97c674af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupPasswordDependency778bf5389a70d7df6152Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupEmailAuthCodeVerifyDependencyaf9da1ebf0e9e5f1b708Provider: SignupEmailAuthCodeVerifyDependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var idSettingFactory: any IDSettingFactory {
        return appComponent.idSettingFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupEmailAuthCodeVerifyComponent
private func factoryb06be35aa893adde971bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupEmailAuthCodeVerifyDependencyaf9da1ebf0e9e5f1b708Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupTermsDependency1c828944ed111a755519Provider: SignupTermsDependency {
    var signupUseCase: any SignupUseCase {
        return appComponent.signupUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupTermsComponent
private func factoryf84223c07d964abc9b0ef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupTermsDependency1c828944ed111a755519Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupEmailVerifyDependencyf9d372ac752ee19b78caProvider: SignupEmailVerifyDependency {
    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase {
        return appComponent.checkDuplicateEmailUseCase
    }
    var signupEmailAuthCodeVerifyFactory: any SignupEmailAuthCodeVerifyFactory {
        return appComponent.signupEmailAuthCodeVerifyFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupEmailVerifyComponent
private func factory3b1904c76335d70151ebf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupEmailVerifyDependencyf9d372ac752ee19b78caProvider(appComponent: parent1(component) as! AppComponent)
}
private class SignupProfileImageDependency4203088ab57581d9f871Provider: SignupProfileImageDependency {
    var uploadFileUseCase: any UploadFileUseCase {
        return appComponent.uploadFileUseCase
    }
    var signupTermsFactory: any SignupTermsFactory {
        return appComponent.signupTermsFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupProfileImageComponent
private func factory6792674212c15df7e9cff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupProfileImageDependency4203088ab57581d9f871Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {
    var homeFactory: any HomeFactory {
        return appComponent.homeFactory
    }
    var applyPageFactory: any ApplyPageFactory {
        return appComponent.applyPageFactory
    }
    var noticeListFactory: any NoticeListFactory {
        return appComponent.noticeListFactory
    }
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
}
private class SetNotificationDependency51c11ff0b19da5469478Provider: SetNotificationDependency {
    var subscribeTopicUseCase: any SubscribeTopicUseCase {
        return appComponent.subscribeTopicUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SetNotificationComponent
private func factory7b192ee7636dfe394db2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SetNotificationDependency51c11ff0b19da5469478Provider(appComponent: parent1(component) as! AppComponent)
}
private class MyPageDependency48d84b530313b3ee40feProvider: MyPageDependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        return appComponent.fetchMyProfileUseCase
    }
    var logoutUseCase: any LogoutUseCase {
        return appComponent.logoutUseCase
    }
    var withdrawalUseCase: any WithdrawalUseCase {
        return appComponent.withdrawalUseCase
    }
    var changeProfileFactory: any ChangeProfileFactory {
        return appComponent.changeProfileFactory
    }
    var rewardPointDetailFactory: any RewardPointDetailFactory {
        return appComponent.rewardPointDetailFactory
    }
    var checkPasswordFactory: any CheckPasswordFactory {
        return appComponent.checkPasswordFactory
    }
    var setNotificationFactory: any SetNotificationFactory {
        return appComponent.setNotificationFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class ModifyPasswordDependency8e8e0713c7893c69f342Provider: ModifyPasswordDependency {
    var changePasswordUseCase: any ChangePasswordUseCase {
        return appComponent.changePasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ModifyPasswordComponent
private func factoryf1815b12945a9aa456a2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ModifyPasswordDependency8e8e0713c7893c69f342Provider(appComponent: parent1(component) as! AppComponent)
}
private class RewardPointDetailDependency623f1251c3863ea3b233Provider: RewardPointDetailDependency {
    var fetchPointListUseCase: any FetchPointListUseCase {
        return appComponent.fetchPointListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RewardPointDetailComponent
private func factory87993268d9e212be8b1af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RewardPointDetailDependency623f1251c3863ea3b233Provider(appComponent: parent1(component) as! AppComponent)
}
private class ChangeProfileDependency18055275199967076a28Provider: ChangeProfileDependency {
    var changeProfileImageUseCase: any ChangeProfileImageUseCase {
        return appComponent.changeProfileImageUseCase
    }
    var uploadFileUseCase: any UploadFileUseCase {
        return appComponent.uploadFileUseCase
    }
    var fetchPresignedURLUseCase: any FetchPresignedURLUseCase {
        return appComponent.fetchPresignedURLUseCase
    }
    var presignedUploadFileUseCase: any PresignedUploadFileUseCase {
        return appComponent.presignedUploadFileUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ChangeProfileComponent
private func factory239204ef0c47c0c68c97f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ChangeProfileDependency18055275199967076a28Provider(appComponent: parent1(component) as! AppComponent)
}
private class CheckPasswordDependencyd8ff624643356835c570Provider: CheckPasswordDependency {
    var compareCurrentPasswordUseCase: any CompareCurrentPasswordUseCase {
        return appComponent.compareCurrentPasswordUseCase
    }
    var modifyPasswordFactory: any ModifyPasswordFactory {
        return appComponent.modifyPasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CheckPasswordComponent
private func factorycb24ea072925f86bef40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CheckPasswordDependencyd8ff624643356835c570Provider(appComponent: parent1(component) as! AppComponent)
}
private class StudyRoomDetailDependency00589e4f8d1416a01b43Provider: StudyRoomDetailDependency {
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase {
        return appComponent.fetchStudyAvailableTimeUseCase
    }
    var fetchSeatTypesUseCase: any FetchSeatTypesUseCase {
        return appComponent.fetchSeatTypesUseCase
    }
    var fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase {
        return appComponent.fetchDetailStudyRoomUseCase
    }
    var applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase {
        return appComponent.applyStudyRoomSeatUseCase
    }
    var cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase {
        return appComponent.cancelStudyRoomSeatUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudyRoomDetailComponent
private func factorya36f40c25dcb280bae0ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudyRoomDetailDependency00589e4f8d1416a01b43Provider(appComponent: parent1(component) as! AppComponent)
}
private class StudyRoomListDependencyef56e26c25d5de596604Provider: StudyRoomListDependency {
    var fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase {
        return appComponent.fetchStudyRoomListUseCase
    }
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase {
        return appComponent.fetchStudyAvailableTimeUseCase
    }
    var fetchStudyroomTimeListUseCase: any FetchStudyroomTimeListUseCase {
        return appComponent.fetchStudyroomTimeListUseCase
    }
    var studyRoomDetailFactory: any StudyRoomDetailFactory {
        return appComponent.studyRoomDetailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudyRoomListComponent
private func factory7451c5364e65ee2d46bbf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudyRoomListDependencyef56e26c25d5de596604Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinFactory: any SigninFactory {
        return appComponent.signinFactory
    }
    var mainTabFactory: any MainTabFactory {
        return appComponent.mainTabFactory
    }
    var splashFactory: any SplashFactory {
        return appComponent.splashFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {
    var signinUseCase: any SigninUseCase {
        return appComponent.signinUseCase
    }
    var schoolCodeFactory: any SchoolCodeFactory {
        return appComponent.schoolCodeFactory
    }
    var findIDFactory: any FindIDFactory {
        return appComponent.findIDFactory
    }
    var enterInformationFactory: any EnterInformationFactory {
        return appComponent.enterInformationFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debccf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {
    var fetchMealListUseCase: any FetchMealListUseCase {
        return appComponent.fetchMealListUseCase
    }
    var fetchWhetherNewNoticeUseCase: any FetchWhetherNewNoticeUseCase {
        return appComponent.fetchWhetherNewNoticeUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}
private class ApplyPageDependency3fe4e7c221b14c86d427Provider: ApplyPageDependency {
    var studyRoomListFactory: any StudyRoomListFactory {
        return appComponent.studyRoomListFactory
    }
    var remainApplyFactory: any RemainApplyFactory {
        return appComponent.remainApplyFactory
    }
    var outingCheckFactory: any OutingCheckFactory {
        return appComponent.outingCheckFactory
    }
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        return appComponent.fetchMyRemainApplicationItemsUseCase
    }
    var fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase {
        return appComponent.fetchMyStudyRoomAppItemsUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ApplyPageComponent
private func factory45f688c5d4c7f313fc8df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ApplyPageDependency3fe4e7c221b14c86d427Provider(appComponent: parent1(component) as! AppComponent)
}
private class AuthenticationEmailDependency73189eb572618b10e0fbProvider: AuthenticationEmailDependency {
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var changePasswordFactory: any ChangePasswordFactory {
        return appComponent.changePasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AuthenticationEmailComponent
private func factory8798d0becd9d2870112af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthenticationEmailDependency73189eb572618b10e0fbProvider(appComponent: parent1(component) as! AppComponent)
}
private class ChangePasswordDependency04ab7ced24136c4fb27eProvider: ChangePasswordDependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase {
        return appComponent.renewalPasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ChangePasswordComponent
private func factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ChangePasswordDependency04ab7ced24136c4fb27eProvider(appComponent: parent1(component) as! AppComponent)
}
private class EnterInformationDependency9204f24c784151f429ddProvider: EnterInformationDependency {
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        return appComponent.checkAccountIDIsExistUseCase
    }
    var authenticationEmailFactory: any AuthenticationEmailFactory {
        return appComponent.authenticationEmailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->EnterInformationComponent
private func factory359a960501e79e833f64f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EnterInformationDependency9204f24c784151f429ddProvider(appComponent: parent1(component) as! AppComponent)
}
private class RemainApplyDependency4d8caef674dc801cbb54Provider: RemainApplyDependency {
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        return appComponent.fetchMyRemainApplicationItemsUseCase
    }
    var fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase {
        return appComponent.fetchRemainApplicationListUseCase
    }
    var fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase {
        return appComponent.fetchRemainsAvailableTimeUseCase
    }
    var remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase {
        return appComponent.remainingApplicationsChangesUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RemainApplyComponent
private func factory9615846346c92a2f8176f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RemainApplyDependency4d8caef674dc801cbb54Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeListDependency0e93eb53be8626c408e4Provider: NoticeListDependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase {
        return appComponent.fetchNoticeListUseCase
    }
    var noticeDetailFactory: any NoticeDetailFactory {
        return appComponent.noticeDetailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeListComponent
private func factorye14e687c08985bdffcd0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeListDependency0e93eb53be8626c408e4Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeDetailDependency714af3aed40eaebda420Provider: NoticeDetailDependency {
    var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase {
        return appComponent.fetchDetailNoticeUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeDetailComponent
private func factory3db143c2f80d621d5a7ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailDependency714af3aed40eaebda420Provider(appComponent: parent1(component) as! AppComponent)
}
private class OutingCheckDependency591e8e88076d3b14912fProvider: OutingCheckDependency {
    var outingApplyFactory: any OutingApplyFactory {
        return appComponent.outingApplyFactory
    }
    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase {
        return appComponent.fetchMyOutingApplicationItemUseCase
    }
    var deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase {
        return appComponent.deleteOutingApplicationItemUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->OutingCheckComponent
private func factorydd9d68d4ee2860760687f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OutingCheckDependency591e8e88076d3b14912fProvider(appComponent: parent1(component) as! AppComponent)
}
private class OutingApplyDependency9697a35706d45fe3b1a6Provider: OutingApplyDependency {
    var fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase {
        return appComponent.fetchOutingAvailableTimeUseCase
    }
    var fetchOutingTypeUseCase: any FetchOutingTypeUseCase {
        return appComponent.fetchOutingTypeUseCase
    }
    var fetchAllStudentsUseCase: any FetchAllStudentsUseCase {
        return appComponent.fetchAllStudentsUseCase
    }
    var outingApplicationUseCase: any OutingApplicationUseCase {
        return appComponent.outingApplicationUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->OutingApplyComponent
private func factory7be30f25c2431cde1fd8f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OutingApplyDependency9697a35706d45fe3b1a6Provider(appComponent: parent1(component) as! AppComponent)
}
private class FindIDDependencyb481fe947a844cc29913Provider: FindIDDependency {
    var findIDUseCase: any FindIDUseCase {
        return appComponent.findIDUseCase
    }
    var fetchSchoolListUseCase: any FetchSchoolListUseCase {
        return appComponent.fetchSchoolListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindIDComponent
private func factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindIDDependencyb481fe947a844cc29913Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-any Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteStudyRoomsDataSource-any RemoteStudyRoomsDataSource"] = { [unowned self] in self.remoteStudyRoomsDataSource as Any }
        localTable["studyRoomsRepository-any StudyRoomsRepository"] = { [unowned self] in self.studyRoomsRepository as Any }
        localTable["fetchStudyAvailableTimeUseCase-any FetchStudyAvailableTimeUseCase"] = { [unowned self] in self.fetchStudyAvailableTimeUseCase as Any }
        localTable["fetchSeatTypesUseCase-any FetchSeatTypesUseCase"] = { [unowned self] in self.fetchSeatTypesUseCase as Any }
        localTable["fetchStudyRoomListUseCase-any FetchStudyRoomListUseCase"] = { [unowned self] in self.fetchStudyRoomListUseCase as Any }
        localTable["fetchDetailStudyRoomUseCase-any FetchDetailStudyRoomUseCase"] = { [unowned self] in self.fetchDetailStudyRoomUseCase as Any }
        localTable["applyStudyRoomSeatUseCase-any ApplyStudyRoomSeatUseCase"] = { [unowned self] in self.applyStudyRoomSeatUseCase as Any }
        localTable["cancelStudyRoomSeatUseCase-any CancelStudyRoomSeatUseCase"] = { [unowned self] in self.cancelStudyRoomSeatUseCase as Any }
        localTable["fetchMyStudyRoomAppItemsUseCase-any FetchMyStudyRoomAppItemsUseCase"] = { [unowned self] in self.fetchMyStudyRoomAppItemsUseCase as Any }
        localTable["fetchStudyroomTimeListUseCase-any FetchStudyroomTimeListUseCase"] = { [unowned self] in self.fetchStudyroomTimeListUseCase as Any }
        localTable["remotePresignedDataSource-any RemotePresignedDataSource"] = { [unowned self] in self.remotePresignedDataSource as Any }
        localTable["presignedRepository-any PresignedRepository"] = { [unowned self] in self.presignedRepository as Any }
        localTable["presignedUploadFileUseCase-any PresignedUploadFileUseCase"] = { [unowned self] in self.presignedUploadFileUseCase as Any }
        localTable["localAuthDataSource-any LocalAuthDataSource"] = { [unowned self] in self.localAuthDataSource as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in self.remoteAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["signinUseCase-any SigninUseCase"] = { [unowned self] in self.signinUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { [unowned self] in self.verifyAuthCodeUseCase as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { [unowned self] in self.sendAuthCodeUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in self.reissueTokenUseCase as Any }
        localTable["checkEmailExistByAccountIDUseCase-any CheckEmailExistByAccountIDUseCase"] = { [unowned self] in self.checkEmailExistByAccountIDUseCase as Any }
        localTable["checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"] = { [unowned self] in self.checkAccountIDIsExistUseCase as Any }
        localTable["logoutUseCase-any LogoutUseCase"] = { [unowned self] in self.logoutUseCase as Any }
        localTable["remoteNotificationDataSource-any RemoteNotificationDataSource"] = { [unowned self] in self.remoteNotificationDataSource as Any }
        localTable["notificationRepository-any NotificationRepository"] = { [unowned self] in self.notificationRepository as Any }
        localTable["subscribeTopicUseCase-any SubscribeTopicUseCase"] = { [unowned self] in self.subscribeTopicUseCase as Any }
        localTable["schoolCodeFactory-any SchoolCodeFactory"] = { [unowned self] in self.schoolCodeFactory as Any }
        localTable["findIDFactory-any FindIDFactory"] = { [unowned self] in self.findIDFactory as Any }
        localTable["signinFactory-any SigninFactory"] = { [unowned self] in self.signinFactory as Any }
        localTable["splashFactory-any SplashFactory"] = { [unowned self] in self.splashFactory as Any }
        localTable["schoolConfirmationQuestionsFactory-any SchoolConfirmationQuestionsFactory"] = { [unowned self] in self.schoolConfirmationQuestionsFactory as Any }
        localTable["signupEmailVerifyFactory-any SignupEmailVerifyFactory"] = { [unowned self] in self.signupEmailVerifyFactory as Any }
        localTable["signupEmailAuthCodeVerifyFactory-any SignupEmailAuthCodeVerifyFactory"] = { [unowned self] in self.signupEmailAuthCodeVerifyFactory as Any }
        localTable["idSettingFactory-any IDSettingFactory"] = { [unowned self] in self.idSettingFactory as Any }
        localTable["enterInformationFactory-any EnterInformationFactory"] = { [unowned self] in self.enterInformationFactory as Any }
        localTable["authenticationEmailFactory-any AuthenticationEmailFactory"] = { [unowned self] in self.authenticationEmailFactory as Any }
        localTable["changePasswordFactory-any ChangePasswordFactory"] = { [unowned self] in self.changePasswordFactory as Any }
        localTable["signupProfileImageFactory-any SignupProfileImageFactory"] = { [unowned self] in self.signupProfileImageFactory as Any }
        localTable["signupPasswordFactory-any SignupPasswordFactory"] = { [unowned self] in self.signupPasswordFactory as Any }
        localTable["signupTermsFactory-any SignupTermsFactory"] = { [unowned self] in self.signupTermsFactory as Any }
        localTable["mainTabFactory-any MainTabFactory"] = { [unowned self] in self.mainTabFactory as Any }
        localTable["homeFactory-any HomeFactory"] = { [unowned self] in self.homeFactory as Any }
        localTable["studyRoomDetailFactory-any StudyRoomDetailFactory"] = { [unowned self] in self.studyRoomDetailFactory as Any }
        localTable["noticeListFactory-any NoticeListFactory"] = { [unowned self] in self.noticeListFactory as Any }
        localTable["myPageFactory-any MyPageFactory"] = { [unowned self] in self.myPageFactory as Any }
        localTable["changeProfileFactory-any ChangeProfileFactory"] = { [unowned self] in self.changeProfileFactory as Any }
        localTable["noticeDetailFactory-any NoticeDetailFactory"] = { [unowned self] in self.noticeDetailFactory as Any }
        localTable["rewardPointDetailFactory-any RewardPointDetailFactory"] = { [unowned self] in self.rewardPointDetailFactory as Any }
        localTable["checkPasswordFactory-any CheckPasswordFactory"] = { [unowned self] in self.checkPasswordFactory as Any }
        localTable["modifyPasswordFactory-any ModifyPasswordFactory"] = { [unowned self] in self.modifyPasswordFactory as Any }
        localTable["setNotificationFactory-any SetNotificationFactory"] = { [unowned self] in self.setNotificationFactory as Any }
        localTable["studyRoomListFactory-any StudyRoomListFactory"] = { [unowned self] in self.studyRoomListFactory as Any }
        localTable["applyPageFactory-any ApplyPageFactory"] = { [unowned self] in self.applyPageFactory as Any }
        localTable["remainApplyFactory-any RemainApplyFactory"] = { [unowned self] in self.remainApplyFactory as Any }
        localTable["outingApplyFactory-any OutingApplyFactory"] = { [unowned self] in self.outingApplyFactory as Any }
        localTable["outingCheckFactory-any OutingCheckFactory"] = { [unowned self] in self.outingCheckFactory as Any }
        localTable["remoteNoticeDataSource-any RemoteNoticeDataSource"] = { [unowned self] in self.remoteNoticeDataSource as Any }
        localTable["noticeRepository-any NoticeRepository"] = { [unowned self] in self.noticeRepository as Any }
        localTable["fetchWhetherNewNoticeUseCase-any FetchWhetherNewNoticeUseCase"] = { [unowned self] in self.fetchWhetherNewNoticeUseCase as Any }
        localTable["fetchNoticeListUseCase-any FetchNoticeListUseCase"] = { [unowned self] in self.fetchNoticeListUseCase as Any }
        localTable["fetchDetailNoticeUseCase-any FetchDetailNoticeUseCase"] = { [unowned self] in self.fetchDetailNoticeUseCase as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { [unowned self] in self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { [unowned self] in self.studentsRepository as Any }
        localTable["signupUseCase-any SignupUseCase"] = { [unowned self] in self.signupUseCase as Any }
        localTable["checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"] = { [unowned self] in self.checkDuplicateAccountIDUseCase as Any }
        localTable["checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"] = { [unowned self] in self.checkDuplicateEmailUseCase as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { [unowned self] in self.renewalPasswordUseCase as Any }
        localTable["findIDUseCase-any FindIDUseCase"] = { [unowned self] in self.findIDUseCase as Any }
        localTable["checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"] = { [unowned self] in self.checkExistGradeClassNumberUseCase as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { [unowned self] in self.fetchMyProfileUseCase as Any }
        localTable["changeProfileImageUseCase-any ChangeProfileImageUseCase"] = { [unowned self] in self.changeProfileImageUseCase as Any }
        localTable["withdrawalUseCase-any WithdrawalUseCase"] = { [unowned self] in self.withdrawalUseCase as Any }
        localTable["fetchAllStudentsUseCase-any FetchAllStudentsUseCase"] = { [unowned self] in self.fetchAllStudentsUseCase as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { [unowned self] in self.remoteUsersDataSource as Any }
        localTable["usersRepository-any UsersRepository"] = { [unowned self] in self.usersRepository as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { [unowned self] in self.changePasswordUseCase as Any }
        localTable["compareCurrentPasswordUseCase-any CompareCurrentPasswordUseCase"] = { [unowned self] in self.compareCurrentPasswordUseCase as Any }
        localTable["remotePointsDataSource-any RemotePointsDataSource"] = { [unowned self] in self.remotePointsDataSource as Any }
        localTable["pointsRepository-any PointsRepository"] = { [unowned self] in self.pointsRepository as Any }
        localTable["fetchPointListUseCase-any FetchPointListUseCase"] = { [unowned self] in self.fetchPointListUseCase as Any }
        localTable["remoteOutingDataSource-any RemoteOutingDataSource"] = { [unowned self] in self.remoteOutingDataSource as Any }
        localTable["outingRepository-any OutingRepository"] = { [unowned self] in self.outingRepository as Any }
        localTable["fetchMyOutingApplicationItemUseCase-any FetchMyOutingApplicationItemUseCase"] = { [unowned self] in self.fetchMyOutingApplicationItemUseCase as Any }
        localTable["fetchOutingAvailableTimeUseCase-any FetchOutingAvailableTimeUseCase"] = { [unowned self] in self.fetchOutingAvailableTimeUseCase as Any }
        localTable["fetchOutingTypeUseCase-any FetchOutingTypeUseCase"] = { [unowned self] in self.fetchOutingTypeUseCase as Any }
        localTable["deleteOutingApplicationItemUseCase-any DeleteOutingApplicationItemUseCase"] = { [unowned self] in self.deleteOutingApplicationItemUseCase as Any }
        localTable["outingApplicationUseCase-any OutingApplicationUseCase"] = { [unowned self] in self.outingApplicationUseCase as Any }
        localTable["remoteMealDataSource-any RemoteMealDataSource"] = { [unowned self] in self.remoteMealDataSource as Any }
        localTable["mealRepository-any MealRepository"] = { [unowned self] in self.mealRepository as Any }
        localTable["fetchMealListUseCase-any FetchMealListUseCase"] = { [unowned self] in self.fetchMealListUseCase as Any }
        localTable["remoteFilesDataSource-any RemoteFilesDataSource"] = { [unowned self] in self.remoteFilesDataSource as Any }
        localTable["filesRepository-any FilesRepository"] = { [unowned self] in self.filesRepository as Any }
        localTable["uploadFileUseCase-any UploadFileUseCase"] = { [unowned self] in self.uploadFileUseCase as Any }
        localTable["fetchPresignedURLUseCase-any FetchPresignedURLUseCase"] = { [unowned self] in self.fetchPresignedURLUseCase as Any }
        localTable["remoteRemainsDataSource-any RemoteRemainsDataSource"] = { [unowned self] in self.remoteRemainsDataSource as Any }
        localTable["remainsRepository-any RemainsRepository"] = { [unowned self] in self.remainsRepository as Any }
        localTable["remainingApplicationsChangesUseCase-any RemainingApplicationsChangesUseCase"] = { [unowned self] in self.remainingApplicationsChangesUseCase as Any }
        localTable["fetchMyRemainApplicationItemsUseCase-any FetchMyRemainApplicationItemsUseCase"] = { [unowned self] in self.fetchMyRemainApplicationItemsUseCase as Any }
        localTable["fetchRemainApplicationListUseCase-any FetchRemainApplicationListUseCase"] = { [unowned self] in self.fetchRemainApplicationListUseCase as Any }
        localTable["fetchRemainsAvailableTimeUseCase-any FetchRemainsAvailableTimeUseCase"] = { [unowned self] in self.fetchRemainsAvailableTimeUseCase as Any }
        localTable["remoteSchoolDataSource-any RemoteSchoolDataSource"] = { [unowned self] in self.remoteSchoolDataSource as Any }
        localTable["schoolRepository-any SchoolRepository"] = { [unowned self] in self.schoolRepository as Any }
        localTable["fetchSchoolListUseCase-any FetchSchoolListUseCase"] = { [unowned self] in self.fetchSchoolListUseCase as Any }
        localTable["fetchSchoolQuestionUseCase-any FetchSchoolQuestionUseCase"] = { [unowned self] in self.fetchSchoolQuestionUseCase as Any }
        localTable["checkSchoolQuestionUseCase-any CheckSchoolQuestionUseCase"] = { [unowned self] in self.checkSchoolQuestionUseCase as Any }
        localTable["checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"] = { [unowned self] in self.checkSchoolCodeUseCase as Any }
    }
}
extension SplashComponent: Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.reissueTokenUseCase] = "reissueTokenUseCase-any ReissueTokenUseCase"
    }
}
extension SchoolConfirmationQuestionsComponent: Registration {
    public func registerItems() {
        keyPathToName[\SchoolConfirmationQuestionsDependency.checkSchoolQuestionUseCase] = "checkSchoolQuestionUseCase-any CheckSchoolQuestionUseCase"
        keyPathToName[\SchoolConfirmationQuestionsDependency.fetchSchoolQuestionUseCase] = "fetchSchoolQuestionUseCase-any FetchSchoolQuestionUseCase"
        keyPathToName[\SchoolConfirmationQuestionsDependency.signupEmailVerifyFactory] = "signupEmailVerifyFactory-any SignupEmailVerifyFactory"
    }
}
extension SchoolCodeComponent: Registration {
    public func registerItems() {
        keyPathToName[\SchoolCodeDependency.checkSchoolCodeUseCase] = "checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"
        keyPathToName[\SchoolCodeDependency.schoolConfirmationQuestionsFactory] = "schoolConfirmationQuestionsFactory-any SchoolConfirmationQuestionsFactory"
    }
}
extension IDSettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\IDSettingDependency.checkExistGradeClassNumberUseCase] = "checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"
        keyPathToName[\IDSettingDependency.checkDuplicateAccountIDUseCase] = "checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"
        keyPathToName[\IDSettingDependency.signupPasswordFactory] = "signupPasswordFactory-any SignupPasswordFactory"
    }
}
extension SignupPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupPasswordDependency.signupProfileImageFactory] = "signupProfileImageFactory-any SignupProfileImageFactory"
    }
}
extension SignupEmailAuthCodeVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupEmailAuthCodeVerifyDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\SignupEmailAuthCodeVerifyDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\SignupEmailAuthCodeVerifyDependency.idSettingFactory] = "idSettingFactory-any IDSettingFactory"
    }
}
extension SignupTermsComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupTermsDependency.signupUseCase] = "signupUseCase-any SignupUseCase"
    }
}
extension SignupEmailVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupEmailVerifyDependency.checkDuplicateEmailUseCase] = "checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"
        keyPathToName[\SignupEmailVerifyDependency.signupEmailAuthCodeVerifyFactory] = "signupEmailAuthCodeVerifyFactory-any SignupEmailAuthCodeVerifyFactory"
    }
}
extension SignupProfileImageComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupProfileImageDependency.uploadFileUseCase] = "uploadFileUseCase-any UploadFileUseCase"
        keyPathToName[\SignupProfileImageDependency.signupTermsFactory] = "signupTermsFactory-any SignupTermsFactory"
    }
}
extension MainTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainTabDependency.homeFactory] = "homeFactory-any HomeFactory"
        keyPathToName[\MainTabDependency.applyPageFactory] = "applyPageFactory-any ApplyPageFactory"
        keyPathToName[\MainTabDependency.noticeListFactory] = "noticeListFactory-any NoticeListFactory"
        keyPathToName[\MainTabDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
    }
}
extension SetNotificationComponent: Registration {
    public func registerItems() {
        keyPathToName[\SetNotificationDependency.subscribeTopicUseCase] = "subscribeTopicUseCase-any SubscribeTopicUseCase"
    }
}
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDependency.fetchMyProfileUseCase] = "fetchMyProfileUseCase-any FetchMyProfileUseCase"
        keyPathToName[\MyPageDependency.logoutUseCase] = "logoutUseCase-any LogoutUseCase"
        keyPathToName[\MyPageDependency.withdrawalUseCase] = "withdrawalUseCase-any WithdrawalUseCase"
        keyPathToName[\MyPageDependency.changeProfileFactory] = "changeProfileFactory-any ChangeProfileFactory"
        keyPathToName[\MyPageDependency.rewardPointDetailFactory] = "rewardPointDetailFactory-any RewardPointDetailFactory"
        keyPathToName[\MyPageDependency.checkPasswordFactory] = "checkPasswordFactory-any CheckPasswordFactory"
        keyPathToName[\MyPageDependency.setNotificationFactory] = "setNotificationFactory-any SetNotificationFactory"
    }
}
extension ModifyPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ModifyPasswordDependency.changePasswordUseCase] = "changePasswordUseCase-any ChangePasswordUseCase"
    }
}
extension RewardPointDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\RewardPointDetailDependency.fetchPointListUseCase] = "fetchPointListUseCase-any FetchPointListUseCase"
    }
}
extension ChangeProfileComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangeProfileDependency.changeProfileImageUseCase] = "changeProfileImageUseCase-any ChangeProfileImageUseCase"
        keyPathToName[\ChangeProfileDependency.uploadFileUseCase] = "uploadFileUseCase-any UploadFileUseCase"
        keyPathToName[\ChangeProfileDependency.fetchPresignedURLUseCase] = "fetchPresignedURLUseCase-any FetchPresignedURLUseCase"
        keyPathToName[\ChangeProfileDependency.presignedUploadFileUseCase] = "presignedUploadFileUseCase-any PresignedUploadFileUseCase"
    }
}
extension CheckPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\CheckPasswordDependency.compareCurrentPasswordUseCase] = "compareCurrentPasswordUseCase-any CompareCurrentPasswordUseCase"
        keyPathToName[\CheckPasswordDependency.modifyPasswordFactory] = "modifyPasswordFactory-any ModifyPasswordFactory"
    }
}
extension StudyRoomDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudyRoomDetailDependency.fetchStudyAvailableTimeUseCase] = "fetchStudyAvailableTimeUseCase-any FetchStudyAvailableTimeUseCase"
        keyPathToName[\StudyRoomDetailDependency.fetchSeatTypesUseCase] = "fetchSeatTypesUseCase-any FetchSeatTypesUseCase"
        keyPathToName[\StudyRoomDetailDependency.fetchDetailStudyRoomUseCase] = "fetchDetailStudyRoomUseCase-any FetchDetailStudyRoomUseCase"
        keyPathToName[\StudyRoomDetailDependency.applyStudyRoomSeatUseCase] = "applyStudyRoomSeatUseCase-any ApplyStudyRoomSeatUseCase"
        keyPathToName[\StudyRoomDetailDependency.cancelStudyRoomSeatUseCase] = "cancelStudyRoomSeatUseCase-any CancelStudyRoomSeatUseCase"
    }
}
extension StudyRoomListComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudyRoomListDependency.fetchStudyRoomListUseCase] = "fetchStudyRoomListUseCase-any FetchStudyRoomListUseCase"
        keyPathToName[\StudyRoomListDependency.fetchStudyAvailableTimeUseCase] = "fetchStudyAvailableTimeUseCase-any FetchStudyAvailableTimeUseCase"
        keyPathToName[\StudyRoomListDependency.fetchStudyroomTimeListUseCase] = "fetchStudyroomTimeListUseCase-any FetchStudyroomTimeListUseCase"
        keyPathToName[\StudyRoomListDependency.studyRoomDetailFactory] = "studyRoomDetailFactory-any StudyRoomDetailFactory"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinFactory] = "signinFactory-any SigninFactory"
        keyPathToName[\RootDependency.mainTabFactory] = "mainTabFactory-any MainTabFactory"
        keyPathToName[\RootDependency.splashFactory] = "splashFactory-any SplashFactory"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
        keyPathToName[\SigninDependency.schoolCodeFactory] = "schoolCodeFactory-any SchoolCodeFactory"
        keyPathToName[\SigninDependency.findIDFactory] = "findIDFactory-any FindIDFactory"
        keyPathToName[\SigninDependency.enterInformationFactory] = "enterInformationFactory-any EnterInformationFactory"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.fetchMealListUseCase] = "fetchMealListUseCase-any FetchMealListUseCase"
        keyPathToName[\HomeDependency.fetchWhetherNewNoticeUseCase] = "fetchWhetherNewNoticeUseCase-any FetchWhetherNewNoticeUseCase"
    }
}
extension ApplyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\ApplyPageDependency.studyRoomListFactory] = "studyRoomListFactory-any StudyRoomListFactory"
        keyPathToName[\ApplyPageDependency.remainApplyFactory] = "remainApplyFactory-any RemainApplyFactory"
        keyPathToName[\ApplyPageDependency.outingCheckFactory] = "outingCheckFactory-any OutingCheckFactory"
        keyPathToName[\ApplyPageDependency.fetchMyRemainApplicationItemsUseCase] = "fetchMyRemainApplicationItemsUseCase-any FetchMyRemainApplicationItemsUseCase"
        keyPathToName[\ApplyPageDependency.fetchMyStudyRoomAppItemsUseCase] = "fetchMyStudyRoomAppItemsUseCase-any FetchMyStudyRoomAppItemsUseCase"
    }
}
extension AuthenticationEmailComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthenticationEmailDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.changePasswordFactory] = "changePasswordFactory-any ChangePasswordFactory"
    }
}
extension ChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangePasswordDependency.renewalPasswordUseCase] = "renewalPasswordUseCase-any RenewalPasswordUseCase"
    }
}
extension EnterInformationComponent: Registration {
    public func registerItems() {
        keyPathToName[\EnterInformationDependency.checkAccountIDIsExistUseCase] = "checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"
        keyPathToName[\EnterInformationDependency.authenticationEmailFactory] = "authenticationEmailFactory-any AuthenticationEmailFactory"
    }
}
extension RemainApplyComponent: Registration {
    public func registerItems() {
        keyPathToName[\RemainApplyDependency.fetchMyRemainApplicationItemsUseCase] = "fetchMyRemainApplicationItemsUseCase-any FetchMyRemainApplicationItemsUseCase"
        keyPathToName[\RemainApplyDependency.fetchRemainApplicationListUseCase] = "fetchRemainApplicationListUseCase-any FetchRemainApplicationListUseCase"
        keyPathToName[\RemainApplyDependency.fetchRemainsAvailableTimeUseCase] = "fetchRemainsAvailableTimeUseCase-any FetchRemainsAvailableTimeUseCase"
        keyPathToName[\RemainApplyDependency.remainingApplicationsChangesUseCase] = "remainingApplicationsChangesUseCase-any RemainingApplicationsChangesUseCase"
    }
}
extension NoticeListComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeListDependency.fetchNoticeListUseCase] = "fetchNoticeListUseCase-any FetchNoticeListUseCase"
        keyPathToName[\NoticeListDependency.noticeDetailFactory] = "noticeDetailFactory-any NoticeDetailFactory"
    }
}
extension NoticeDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeDetailDependency.fetchDetailNoticeUseCase] = "fetchDetailNoticeUseCase-any FetchDetailNoticeUseCase"
    }
}
extension OutingCheckComponent: Registration {
    public func registerItems() {
        keyPathToName[\OutingCheckDependency.outingApplyFactory] = "outingApplyFactory-any OutingApplyFactory"
        keyPathToName[\OutingCheckDependency.fetchMyOutingApplicationItemUseCase] = "fetchMyOutingApplicationItemUseCase-any FetchMyOutingApplicationItemUseCase"
        keyPathToName[\OutingCheckDependency.deleteOutingApplicationItemUseCase] = "deleteOutingApplicationItemUseCase-any DeleteOutingApplicationItemUseCase"
    }
}
extension OutingApplyComponent: Registration {
    public func registerItems() {
        keyPathToName[\OutingApplyDependency.fetchOutingAvailableTimeUseCase] = "fetchOutingAvailableTimeUseCase-any FetchOutingAvailableTimeUseCase"
        keyPathToName[\OutingApplyDependency.fetchOutingTypeUseCase] = "fetchOutingTypeUseCase-any FetchOutingTypeUseCase"
        keyPathToName[\OutingApplyDependency.fetchAllStudentsUseCase] = "fetchAllStudentsUseCase-any FetchAllStudentsUseCase"
        keyPathToName[\OutingApplyDependency.outingApplicationUseCase] = "outingApplicationUseCase-any OutingApplicationUseCase"
    }
}
extension FindIDComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindIDDependency.findIDUseCase] = "findIDUseCase-any FindIDUseCase"
        keyPathToName[\FindIDDependency.fetchSchoolListUseCase] = "fetchSchoolListUseCase-any FetchSchoolListUseCase"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SchoolConfirmationQuestionsComponent", factoryd462667f0418a53210fcf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SchoolCodeComponent", factoryb65c1efbf06b87162473f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->IDSettingComponent", factory8b3573203ea51120dc5af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupPasswordComponent", factorye93d1d56840ff97c674af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupEmailAuthCodeVerifyComponent", factoryb06be35aa893adde971bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupTermsComponent", factoryf84223c07d964abc9b0ef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupEmailVerifyComponent", factory3b1904c76335d70151ebf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupProfileImageComponent", factory6792674212c15df7e9cff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SetNotificationComponent", factory7b192ee7636dfe394db2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ModifyPasswordComponent", factoryf1815b12945a9aa456a2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RewardPointDetailComponent", factory87993268d9e212be8b1af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangeProfileComponent", factory239204ef0c47c0c68c97f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CheckPasswordComponent", factorycb24ea072925f86bef40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudyRoomDetailComponent", factorya36f40c25dcb280bae0ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudyRoomListComponent", factory7451c5364e65ee2d46bbf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ApplyPageComponent", factory45f688c5d4c7f313fc8df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthenticationEmailComponent", factory8798d0becd9d2870112af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangePasswordComponent", factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EnterInformationComponent", factory359a960501e79e833f64f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RemainApplyComponent", factory9615846346c92a2f8176f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeListComponent", factorye14e687c08985bdffcd0f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailComponent", factory3db143c2f80d621d5a7ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->OutingCheckComponent", factorydd9d68d4ee2860760687f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->OutingApplyComponent", factory7be30f25c2431cde1fd8f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindIDComponent", factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
