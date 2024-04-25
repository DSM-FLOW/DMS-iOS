import SwiftUI
import DesignSystem

struct OutingApplyView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Environment(\.dismiss) var dismiss
    @State var dateText = ""
    @State var timeText = ""
    @State var typeText = "선택 1"
    @State var placeText = ""
    @State var reasonText = ""
    @State var selectStudentsText = ""

    init(
        viewModel: OutingApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 1)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.outingAvailableTime, id: \.self) { outingTime in
                        OutingApplyNoticeView(
                            notice: "외출 신청 시간은 \(viewModel.outingDateType) \(outingTime.outingTime) ~ \(viewModel.outingDateType) \(outingTime.arrivalTime) 까지 입니다."
                        )
                    }

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
                        VStack(alignment: .leading) {
                            HStack {
                                Text("' ")
                                    .foregroundColor(.GrayScale.gray10)
                                + Text("*")
                                    .foregroundColor(.blue)
                                + Text(" '는 필수 입력 항목입니다.")
                                    .foregroundColor(.GrayScale.gray10)
                            }
                            .dmsFont(.etc(.caption))
                            .padding(.top, 15)
                            .padding(.bottom, 12)

                            HStack {
                                Text("외출 일자")
                                    .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                    .padding(.top, 12)
                                    .padding(.bottom, 12)

                                Text(Date().toDMSOutingApplicationString())
                                    .dmsFont(.body(.body2), color: .GrayScale.gray6)
                                    .padding(.leading, 20)
                                    .padding(.top, 12)
                                    .padding(.bottom, 12)
                            }

                            OutingApplyTextField("외출 시간", viewModel.outingApplicationTime, $timeText, true)
                                .padding(.top, 12)
                                .padding(.bottom, 12)
                                .disabled(true)
                                .onTapGesture {
                                    viewModel.isShowingOutingTimePickerBottomSheet = true
                                    timeText = viewModel.outingApplicationTime
                                }

                            HStack(spacing: 15) {
                                Menu {
                                    ForEach(viewModel.outingTypeTitles.indices, id: \.self) { index in
                                        Button(viewModel.outingTypeTitles[index], action: {
                                            typeText = viewModel.outingTypeTitles[index]
                                            viewModel.outingTypeTitleApplication = typeText
                                            viewModel.outingTypeTitleApplicationStatus = true
                                        })
                                    }
                                } label: {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("외출 유형")
                                                .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                                .padding(.bottom, 8)
                                            Text("*")
                                                .foregroundColor(.blue)
                                                .padding(.bottom, 4)
                                        }

                                        HStack {
                                            Text(typeText)
                                                .dmsFont(.body(.body2), color: .GrayScale.gray5)
                                                .padding(.trailing, 14)

                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.System.icon)
                                                .padding(.trailing, 5)
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 15)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color.GrayScale.gray5, lineWidth: 1)
                                                .frame(height: 50)
                                        }
                                    }
                                }
                                OutingApplyTextField("동행인", "동행인 추가 ﹢", $selectStudentsText, false)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 12)
                                    .disabled(true)
                                    .onTapGesture {
                                        viewModel.isShowingBottomSheet = true
                                    }
                            }
                            .padding(.top, 12)

                            VStack(alignment: .leading) {
                                Text("외출 사유")
                                    .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                    .padding(.bottom, 8)

                                DMSFormTextEditor("내용을 입력해주세요.", text: $reasonText, minHeight: 150)
                            }
                            DMSWideButton(text: "외출 신청하기", color: .PrimaryVariant.primary) {
                                viewModel.outingTypeTitleApplication = typeText
                                viewModel.outingReasonApplication = reasonText
                                viewModel.isPresentedOutingApplicationItemAlert = true
                            }
                            .alert("", isPresented: $viewModel.isPresentedOutingApplicationItemAlert) {
                                Button("취소", role: .cancel) {}
                                Button("확인", role: .destructive) {
                                    if viewModel.outingApplicationTimeStatus && viewModel.outingTypeTitleApplicationStatus {
                                        viewModel.confirmOutingApplicationItemButtonDidClicked()
                                    } else {
                                        viewModel.isErrorOcuured = true
                                        viewModel.errorMessage = "필수 입력 항목을 확인해주세요."
                                    }
                                }
                                )
                            } message: {
                                Text("외출을 신청하시겠습니까?")
                                    .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            }
                            .padding(.top, 40)
                            .padding(.bottom, 50)
                        }
                        .padding(.horizontal, 24)
                    }
                }
            }
        }
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .dmsBottomSheet(
            isShowing: $viewModel.isShowingBottomSheet,
            isGrabberOn: false,
            sheetCornerRadiusValue: 16
        ) {
            DeferView {
                SelectStudentView(
                    viewModel: viewModel,
                    selectStudentsText: $selectStudentsText
                )
                .frame(height: 512)
                .padding(.vertical, 24)
            }
        }
        .dmsBottomSheet(
            isShowing: $viewModel.isShowingOutingTimePickerBottomSheet,
            isGrabberOn: false,
            sheetCornerRadiusValue: 16
        ) {
            DeferView {
                OutingTimePickerView(
                    viewModel: viewModel,
                    timeText: $timeText
                )
                .frame(height: 250)
                .padding(.vertical, 24)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
    }
}
