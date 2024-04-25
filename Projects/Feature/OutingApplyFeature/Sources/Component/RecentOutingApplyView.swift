import DesignSystem
import SwiftUI

struct RecentOutingApplyView: View {
    @StateObject var viewModel: OutingApplyViewModel
    let date: String
    let type: String
    let isAccepted: Bool
    let startTime: String
    let endTime: String
    let people: String
    let reason: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("최근 내역")
                .dmsFont(.body(.body2), color: .GrayScale.gray5)
                .padding(.top, 5)
                .padding(.bottom, 10)

            ZStack(alignment: .topTrailing) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(date)
                            .dmsFont(.body(.body3), color: .PrimaryVariant.primary)
                            .padding(.top, 3)

                        Text(type)
                            .dmsFont(.title(.title3), color: .GrayScale.gray10)

                        Text("\(startTime) ~ \(endTime)")
                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            .padding(.bottom, 16)

                        HStack {
                            Text("동행자 : ")
                                .dmsFont(.etc(.button), color: .GrayScale.gray7)

                            Text(people)
                                .dmsFont(.body(.body3), color: .GrayScale.gray7)
                        }

                        Text(reason)
                            .dmsFont(.body(.body3), color: .GrayScale.gray6)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 16)
                            .background(Color.GrayScale.gray2)
                            .cornerRadius(10)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        DMSButton(text: "외출 취소", style: .underline, color: .red) {
                            viewModel.deleteOutingApplicationItemButtonDidClicked()
                        }
                        Spacer()
                    }
                }
                .alert("", isPresented: $viewModel.isPresentedDeleteOutingApplicationItemAlert) {
                    Button("취소", role: .cancel) {}
                    Button("확인", role: .destructive) {
                        viewModel.confirmDeleteOutingApplicationItemButtonDidClicked()
                    }
                } message: {
                    Text("외출 신청을 취소하시겠습니까?")
                        .dmsFont(.body(.body2), color: .GrayScale.gray6)
                }
                .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .background(Color.System.surface)
            .cornerRadius(10)
            .dmsShadow(style: .surface)
        }
        .padding(.horizontal, 24)
    }
}
