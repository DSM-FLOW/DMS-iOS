import SwiftUI
import DesignSystem
import OutingApplyFeatureInterface

struct OutingCheckView: View {
    @StateObject var viewModel: OutingCheckViewModel
    @Environment(\.dismiss) var dismiss

    private let outingApplyFactory: any OutingApplyFactory

    init(
        viewModel: OutingCheckViewModel,
        outingApplyFactory: any OutingApplyFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.outingApplyFactory = outingApplyFactory
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    OutingApplyNoticeView(
                        notice: "외출 신청 시간은 저녁 8:00 ~ 오전 11:00 까지 입니다."
                    )
                    .padding(.top, 12)

                    Text("외출 신청 내역")
                        .dmsFont(.body(.body3), color: .GrayScale.gray5)
                        .padding(.top, 24)
                        .padding(.horizontal, 24)

                    Spacer()

                    VStack(alignment: .center) {
                        if viewModel.isApplied {
                            ScrollViewReader { proxy in
                                ScrollView(showsIndicators: false) {
                                    RecentOutingApplyView(
                                        viewModel: viewModel,
                                        date: viewModel.outingDate,
                                        type: viewModel.outingTypeTitle,
                                        isAccepted: false,
                                        startTime: viewModel.startTime,
                                        endTime: viewModel.endTime,
                                        people: viewModel.outingCompanions,
                                        reason: viewModel.outingReason
                                    )
                                }
                                .simultaneousGesture(DragGesture(minimumDistance: 0), including: .all)
                                .onChange(of: viewModel.isApplied) { id in
                                    withAnimation(.linear(duration: 0.5)) {
                                        proxy.scrollTo(id, anchor: .top)
                                    }
                                }
                            }
                        } else if viewModel.isHidden && !viewModel.isApplied {
                            Spacer()
                            VStack {
                                Spacer()
                                Text("지금은 외출 신청 시간이 아닙니다.")
                                    .dmsFont(.etc(.caption))
                                Spacer()
                            }
                            Spacer()

                            DMSWideButton(text: "외출 신청하기", color: .PrimaryVariant.primary) {
                                viewModel.outingApplyButtonDidTap = true
                            }
                            .disabled(viewModel.isHidden)
                            .padding(.horizontal, 24)
                        } else {
                            Spacer()

                            DMSWideButton(text: "외출 신청하기", color: .PrimaryVariant.primary) {
                                viewModel.outingApplyButtonDidTap = true
                            }
                            .disabled(viewModel.isHidden)
                            .padding(.horizontal, 24)
                        }
                    }
                }
            }
        }
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .onAppear {
            viewModel.onAppear()
            viewModel.checkButtonState()
        }
        .navigate(
            to: outingApplyFactory.makeView().eraseToAnyView(),
            when: $viewModel.outingApplyButtonDidTap
        )
    }
}
