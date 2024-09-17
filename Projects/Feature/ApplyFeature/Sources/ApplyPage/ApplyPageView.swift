import BaseFeature
import StudyRoomFeatureInterface
import RemainApplyFeatureInterface
import OutingApplyFeatureInterface
import SwiftUI
import UtilityModule

struct ApplyPageView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: ApplyPageViewModel
    @Environment(\.tabbarHidden) var tabbarHidden

    private let studyRoomListFactory: any StudyRoomListFactory
    private let remainApplyFactory: any RemainApplyFactory
    private let outingCheckFactory: any OutingCheckFactory

    init(
        viewModel: ApplyPageViewModel,
        studyRoomListFactory: any StudyRoomListFactory,
        remainApplyFactory: any RemainApplyFactory,
        outingCheckFactory: any OutingCheckFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studyRoomListFactory = studyRoomListFactory
        self.remainApplyFactory = remainApplyFactory
        self.outingCheckFactory = outingCheckFactory
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 1)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        Spacer()
                            .frame(height: 5)

                        if appState.features.studyRoomService {
                            ApplyListCellView(
                                name: "자습실",
                                content: """
                                자습실 사용이 필요한 경우, 자습실 신청을 통해서 원하는 자리를 신청해 보세요.
                                """,
                                buttonTitle: "자습실 신청하기",
                                applyState: viewModel.studyRoomState,
                                onTapped: {
                                    viewModel.isNavigateToStudy.toggle()
                                }
                            )
                            .onAppear {
                                viewModel.fetchMyStudyRoomApplicationItems()
                            }
                        }

                        if appState.features.remainService {
                            ApplyListCellView(
                                name: "잔류",
                                content: """
                                주말 기숙사 잔류 여부를 확인하고, 잔류 신청을 통해서 잔류 또는 귀가를 신청해 보세요.
                                """,
                                buttonTitle: "잔류 신청하기",
                                applyState: viewModel.remainState,
                                onTapped: {
                                    viewModel.isNavigateToRemain.toggle()
                                }
                            )
                            .onAppear {
                                viewModel.fetchMyRemainApplicationItems()
                            }

                            ApplyListCellView(
                                name: "외출",
                                content: """
                                기숙사 생활 중 밖으로 나갈 일이 있다면, 외출 신청을 통해서 외출해보세요.
                                """,
                                buttonTitle: "외출 신청하기",
                                applyState: nil,
                                onTapped: {
                                    viewModel.isNavigateToOuting.toggle()
                                }
                            )

                            Spacer()
                                .frame(height: 5)
                        }
                    }
                    .padding(.horizontal, 24)
                }
            }
            .refreshable {
                viewModel.refresh()
            }
            .navigationTitle("신청")
            .navigationBarTitleDisplayMode(.inline)
            .dmsBackground()
            .onChange(of: viewModel.isNavigateToStudy) { newValue in
                withAnimation {
                    tabbarHidden.wrappedValue = newValue
                }
            }
            .onChange(of: viewModel.isNavigateToRemain) { newValue in
                withAnimation {
                    tabbarHidden.wrappedValue = newValue
                }
            }
            .onChange(of: viewModel.isNavigateToOuting) { newValue in
                withAnimation {
                    tabbarHidden.wrappedValue = newValue
                }
            }
            .navigate(
                to: studyRoomListFactory.makeView().eraseToAnyView(),
                when: $viewModel.isNavigateToStudy
            )
            .navigate(
                to: remainApplyFactory.makeView().eraseToAnyView(),
                when: $viewModel.isNavigateToRemain
            )
            .navigate(
                to: outingCheckFactory.makeView().eraseToAnyView(),
                when: $viewModel.isNavigateToOuting
            )
        }
        .navigationViewStyle(.stack)
    }
}
