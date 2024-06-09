import BaseFeature
import MyPageFeatureInterface
import DesignSystem
import SwiftUI
import UtilityModule
import Kingfisher

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    @EnvironmentObject var appState: AppState

    private let changeProfileFactory: any ChangeProfileFactory
    private let rewardPointDetailFactory: any RewardPointDetailFactory
    private let checkPasswordFactory: any CheckPasswordFactory
    private let setNotificationFactory: any SetNotificationFactory

    init(
        viewModel: MyPageViewModel,
        changeProfileFactory: any ChangeProfileFactory,
        rewardPointDetailFactory: any RewardPointDetailFactory,
        checkPasswordFactory: any CheckPasswordFactory,
        setNotificationFactory: any SetNotificationFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.changeProfileFactory = changeProfileFactory
        self.rewardPointDetailFactory = rewardPointDetailFactory
        self.checkPasswordFactory = checkPasswordFactory
        self.setNotificationFactory = setNotificationFactory
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("\(viewModel.profile?.gcn ?? "") \(viewModel.profile?.name ?? "Loading...")")
                                .dmsFont(.title(.title1), color: .GrayScale.gray7)

                            Text(viewModel.sexType?.rawValue ?? "")
                                .dmsFont(
                                    .etc(.button),
                                    color: viewModel.sexType == .male ?
                                        .PrimaryVariant.primary : .System.error
                                )
                                .padding(.vertical, 4)
                                .padding(.horizontal, 23.5)
                                .background {
                                    if let sexType = viewModel.sexType {
                                        sexType == .male ?
                                        Color.PrimaryVariant.lighten2 : Color.System.errorContainer
                                    } else { Color.GrayScale.gray4 }
                                }
                                .cornerRadius(24)
                                .padding(.leading, 16)
                        }

                        Text(viewModel.profile?.schoolName ?? "")
                            .dmsFont(.body(.body3), color: .GrayScale.gray6)
                    }

                    Spacer()

                    ZStack(alignment: .bottomTrailing) {
                        KFImage(viewModel.profile?.profileImageURL)
                            .placeholder { _ in
                                ProgressView()
                                    .progressViewStyle(
                                        CircularProgressViewStyle(tint: .white)
                                    )
                                    .frame(width: 74, height: 74)
                                    .background(Color.GrayScale.gray5)
                                    .clipShape(Circle())
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 74, height: 74)
                            .clipShape(Circle())
                            .scaledToFill()

                        Circle()
                            .fill(Color.GrayScale.gray3)
                            .frame(width: 24, height: 24)
                            .overlay {
                                DMSImage(.pencil)
                                    .frame(width: 16, height: 16)
                            }
                    }
                    .onTapGesture {
                        viewModel.profileImageDidTap()
                    }
                }
                .padding(.top, 48)

                Spacer()
                    .frame(height: 55)

                if appState.features.pointService {
                    Text(viewModel.profile?.phrase ?? "")
                        .dmsFont(.body(.body3), color: .GrayScale.gray7)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 20)
                        .background {
                            Color.PrimaryVariant.lighten2
                                .cornerRadius(5)
                        }
                        .padding(.bottom, 5)

                    HStack(spacing: 12) {
                        RewardPointCardView(
                            title: "상점",
                            point: viewModel.profile?.bonusPoint ?? 0,
                            rewardType: .bonusPoint
                        )

                        RewardPointCardView(
                            title: "벌점",
                            point: viewModel.profile?.minusPoint ?? 0,
                            rewardType: .minusPoint
                        )
                    }
                }

                Spacer()
                    .frame(height: 15)

                VStack(alignment: .leading, spacing: 0) {
                    if appState.features.pointService {
                        Button {
                            viewModel.isNavigateRewardPointDetail.toggle()
                        } label: {
                            myPageOptionRowCardView(title: "상벌점 내역 확인")
                                .dmsFont(.body(.body2), color: .GrayScale.gray6)
                                .cornerRadius(10, corners: [.topLeft, .topRight])
                        }

                        Divider()
                            .padding(.horizontal, 10)
                    }

//                    Button {
//                        viewModel.isNavigateSetNotifcation.toggle()
//                    } label: {
//                        myPageOptionRowCardView(title: "알림 설정")
//                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
//                    }
//
//                    Divider()
//                        .padding(.horizontal, 10)

                    Button {
                        viewModel.isNavigateChangePassword.toggle()
                    } label: {
                        myPageOptionRowCardView(title: "비밀번호 변경")
                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            .cornerRadius(10, corners: appState.features.pointService
                                          ? [.bottomLeft, .bottomRight] : .allCorners)
                    }

                }
                .myPageOptionBackground()
                .padding(.bottom, 5)

                VStack(alignment: .leading, spacing: 0) {
                    Button {
                        viewModel.isNavigateBugReport.toggle()
                    } label: {
                        myPageOptionRowCardView(title: "버그 제보함")
                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            .cornerRadius(10, corners: .allCorners)
                    }
                }
                .frame(maxWidth: .infinity)
                .myPageOptionBackground()
                .padding(.bottom, 5)

                VStack(alignment: .leading, spacing: 0) {
                    myPageOptionRowCardView(title: "로그아웃")
                        .dmsFont(.body(.body2), color: .System.error)
                        .onTapGesture(perform: viewModel.logoutButtonDidTap)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .myPageOptionBackground()
                .padding(.bottom, 5)

                VStack(alignment: .leading, spacing: 0) {
                    myPageOptionRowCardView(title: "회원 탈퇴")
                        .dmsFont(.body(.body2), color: .ErrorVariant.error)
                        .onTapGesture(perform: viewModel.withdrawalButtonDidTap)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .myPageOptionBackground()

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 24)
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
        }
        .refreshable {
            viewModel.refresh()
        }
        .dmsBackground()
        .onAppear(perform: viewModel.onAppear)
        .alert("", isPresented: $viewModel.isPresentedLogoutAlert) {
            Button("취소", role: .cancel) {}
            Button("확인", role: .destructive, action: viewModel.confirmLogoutButtonDidTap)
        } message: {
            Text("정말 로그아웃 하시겠습니까?")
                .dmsFont(.body(.body2), color: .GrayScale.gray6)
        }
        .alert("", isPresented: $viewModel.isPresentedWithdrawalAlert) {
            Button("취소", role: .cancel) {}
            Button("탈퇴", role: .destructive, action: viewModel.confirmWithdrawalButtonDidTap)
        } message: {
            Text("정말 회원 탈퇴 하시겠습니까?")
                .dmsFont(.body(.body2), color: .GrayScale.gray6)
        }
        .onChange(of: viewModel.isNavigateChangeProfile) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .onChange(of: viewModel.isNavigateChangePassword) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .onChange(of: viewModel.isSuccessLogout, perform: { newValue in
            if newValue {
                withAnimation {
                    appState.sceneFlow = .auth
                }
            }
        })
        .navigate(
            to: changeProfileFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateChangeProfile
        )
        .navigate(
            to: checkPasswordFactory.makeView().eraseToAnyView()
                .environment(\.rootPresentationMode, $viewModel.isNavigateChangePassword),
            when: $viewModel.isNavigateChangePassword
        )
        .navigate(
            to: rewardPointDetailFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateRewardPointDetail
        )
        .navigate(
            to: setNotificationFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateSetNotifcation
        )
    }

    @ViewBuilder
    func myPageOptionRowCardView(title: String) -> some View {
        HStack {
            Text(title)

            Spacer()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background {
            Color.System.surface
                .dmsShadow(style: .surface)
        }
    }
}
