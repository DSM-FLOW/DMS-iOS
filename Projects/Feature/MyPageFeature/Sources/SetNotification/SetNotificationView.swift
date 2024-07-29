import DesignSystem
import SwiftUI

struct SetNotificationView: View {
    @StateObject var viewModel: SetNotificationViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SetNotificationViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("공지")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)
                .padding(.bottom, 15)

            notificationToggleView(title: "공지 알림", detail: "기숙사 공지에 대한 알림입니다.", isToggleOn: $viewModel.isNoticeOn)

            Text("자습실")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)
                .padding(.bottom, 15)

            notificationToggleView(
                title: "이용 시간 알림",
                detail: "자습실 이용 시작 10분 전에 알림을 받을 수 있습니다.",
                isToggleOn: $viewModel.isTimeSlotOn
            )

            notificationToggleView(
                title: "신청 시간 알림",
                detail: "자습실 신청 시간을 알리는 알림입니다.",
                isToggleOn: $viewModel.isAvailableTimeOn
            )

            Text("상벌점")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)
                .padding(.bottom, 15)

            notificationToggleView(
                title: "상벌점 알림",
                detail: "상벌점이 부여되었을 때 알림을 받아요.",
                isToggleOn: $viewModel.isRewardOn
            )

            Text("외출")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)
                .padding(.bottom, 15)

            notificationToggleView(
                title: "외출 신청 알림",
                detail: "동행자로 외출 신청되었을 때 알림을 받아요.",
                isToggleOn: $viewModel.isOutingOn
            )

            Spacer()
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity)
        .dmsBackButton(dismiss: dismiss)
        .navigationTitle("알림 현황")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }

    @ViewBuilder
    func notificationToggleView(title: String, detail: String, isToggleOn: Binding<Bool>) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .dmsFont(.body(.body2), color: .GrayScale.gray8)
                Text(detail)
                    .dmsFont(.etc(.caption), color: .GrayScale.gray6)
            }
            Spacer()
            Toggle(title, isOn: isToggleOn)
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .PrimaryVariant.primary))
        }
        .padding(.bottom, 30)
    }
}
