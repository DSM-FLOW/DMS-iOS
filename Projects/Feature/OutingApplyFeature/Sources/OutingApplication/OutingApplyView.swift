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

    @FocusState var inFocus: Int?

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 1)

            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        OutingApplyNoticeView(
                            notice: "외출 신청 시간은 저녁 8:00 ~ 오전 11:00 까지 입니다."
                        )

//                        if viewModel.isApplied {  이쪽 수정해야됨
//                            RecentOutingApplyView(
//                                viewModel: viewModel,
//                                date: viewModel.outingDate,
//                                type: viewModel.outingTypeTitle,
//                                isAccepted: false,
//                                startTime: viewModel.startTime,
//                                endTime: viewModel.endTime,
//                                people: viewModel.outingCompanions,
//                                reason: viewModel.outingReason
//                            )
//                        } else {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("' ")
                                        .foregroundColor(.GrayScale.gray10)
                                    + Text("*")
                                        .foregroundColor(.PrimaryVariant.primary)
                                    + Text(" '가 포함 된 필드는 필수로 입력해야 합니다.")
                                        .foregroundColor(.GrayScale.gray10)
                                }
                                .dmsFont(.etc(.caption))
                                .padding(.top, 15)
                                .padding(.bottom, 8)

                                HStack {
                                    Text("외출 일자")
                                        .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                        .padding(.top, 8)
                                        .padding(.bottom, 8)

                                    Text(viewModel.displayDate().toDMSOutingApplicationString())
                                        .dmsFont(.body(.body2), color: .GrayScale.gray6)
                                        .padding(.leading, 20)
                                        .padding(.top, 8)
                                        .padding(.bottom, 8)
                                }
                                .onAppear {
                                    viewModel.currentDate = Date()
                                }

                                OutingTextFieldView("외출 시간", viewModel.outingApplicationTime, $timeText, true)
                                    .padding(.top, 8)
                                    .padding(.bottom, 8)
                                    .disabled(true)
                                    .onTapGesture {
                                        viewModel.isShowingOutingTimePickerBottomSheet = true
                                    }

                                ForEach(viewModel.outingAvailableTime, id: \.self) { time in
                                    Text("외출 가능 시간은 \(time.outingTime) ~ \(time.arrivalTime) 까지 입니다.")
                                        .dmsFont(.etc(.caption), color: .PrimaryVariant.primary)
                                }

                                HStack(spacing: 12) {
                                    Menu {
                                        ForEach(viewModel.outingTypeTitles.indices, id: \.self) { index in
                                            Button(viewModel.outingTypeTitles[index], action: {
                                                typeText = viewModel.outingTypeTitles[index]
                                                viewModel.outingTypeTitleApplication = typeText
                                                viewModel.outingTypeTitleApplicationStatus = true
                                            })
                                        }
                                    } label: {
                                        VStack(alignment: .leading, spacing: 8) {
                                            HStack {
                                                Text("외출 유형")
                                                    .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                                Text("*")
                                                    .foregroundColor(.PrimaryVariant.primary)
                                            }
                                            .padding(.bottom, 10)

                                            HStack {
                                                Text(typeText)
                                                    .dmsFont(.body(.body2), color: .GrayScale.gray5)
                                                    .padding(.trailing, 10)

                                                Image(systemName: "chevron.down")
                                                    .foregroundColor(.System.icon)
                                                    .padding(.trailing, 2)
                                            }
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 12)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color.GrayScale.gray5, lineWidth: 1)
                                                    .frame(height: 53)
                                            }
                                        }
                                    }

                                    OutingTextFieldView("동행인", "동행인 추가 ﹢ ", $selectStudentsText, false)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .disabled(true)
                                        .onTapGesture {
                                            viewModel.isShowingBottomSheet = true
                                        }
                                }

                                VStack(alignment: .leading) {
                                    Text("외출 사유")
                                        .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                        .padding(.bottom, 8)

                                    DMSFormTextEditor("내용을 입력해주세요.", text: $reasonText, minHeight: 150).id(2)
                                        .focused($inFocus, equals: 2)

                                }

                                DMSWideButton(text: "외출 신청하기", color: .PrimaryVariant.primary) {
                                    viewModel.outingTypeTitleApplication = typeText
                                    viewModel.outingReasonApplication = reasonText
                                    viewModel.isPresentedOutingItemAlert = true
                                }
                                .alert("", isPresented: $viewModel.isPresentedOutingItemAlert) {
                                    Button("취소", role: .cancel) {}
                                    Button("확인", role: .destructive) {
                                        if viewModel.outingApplicationTimeStatus &&
                                            viewModel.outingTypeTitleApplicationStatus {
                                            viewModel.confirmOutingApplicationItemButtonDidClicked()
                                        } else {
                                            viewModel.isErrorOcuured = true
                                            viewModel.errorMessage = "필수 입력 항목을 확인해주세요."
                                        }
                                    }
                                } message: {
                                    Text("외출을 신청하시겠습니까?")
                                        .dmsFont(.body(.body2), color: .GrayScale.gray6)
                                }
                                .padding(.top, 40)
                                .padding(.bottom, 70)
                            }
                            .padding(.horizontal, 24)
//                        }
                    }

                    if inFocus == 2 {
                        Color.clear.frame(height: 300)
                    }
                }
                .onChange(of: inFocus) { id in
                    withAnimation(.linear(duration: 0.5)) {
                        proxy.scrollTo(id, anchor: .top)
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
