import SwiftUI
import DesignSystem

struct OutingCheckView: View {
    @StateObject var viewModel: OutingCheckViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: OutingCheckViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            OutingApplyNoticeView(
                notice: "외출 신청 시간은 저녁 8:00 ~ 오전 11:00 까지 입니다."
            )

            if viewModel.isApplied {
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
            } else {
                Text("지금은 외출 신청 시간이 아닙니다.")
                    .padding(.horizontal)
                    .padding(.vertical)
            }

            DMSWideButton(text: "외출 신청하기", color: .PrimaryVariant.primary) {
                viewModel.isPresentedOutingItemAlert = true
            }
            .padding(.top, 40)
            .padding(.bottom, 70)
            .padding(.horizontal, 24)
        }
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .onAppear {
            viewModel.onAppear()
        }
    }
}
