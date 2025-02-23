import DesignSystem
import SwiftUI
import OutingDomainInterface

struct OutingTimePickerView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Binding var timeText: String
    @State var selectedTime = OutingSelectTimeModel()
    @State var isPressed = false

    var body: some View {
        VStack {
            Spacer()

            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color.PrimaryVariant.lighten1.opacity(0.5))
                    .frame(height: 42)

                HStack(alignment: .center) {
                    Spacer()

                    Picker("OutingHourTime", selection: $selectedTime.outingHour) {
                        ForEach(1 ..< 25) { num in
                            Text("\(num)")
                                .dmsFont(.body(.body1), color: .GrayScale.gray10)
                                .padding(.horizontal, 3)
                        }
                    }
                    .pickerStyle(.inline)
                    .listRowBackground(Color.clear)

                    Text(" : ")

                    Picker("OutingMinuteTime", selection: $selectedTime.outingMinute) {
                        ForEach(0 ..< 60) { num in
                            Text("\(num)")
                                .dmsFont(.body(.body1), color: .GrayScale.gray10)
                                .padding(.horizontal, 3)
                        }
                    }
                    .pickerStyle(.inline)
                    .listRowBackground(Color.clear)

                    Spacer()

                    Text(" ~ ")
                        .dmsFont(.title(.title1), color: .GrayScale.gray10)

                    Spacer()

                    Picker("arrivalHourTime", selection: $selectedTime.arrivalHour) {
                        ForEach(1 ..< 25) { num in
                            Text("\(num)")
                                .dmsFont(.body(.body1), color: .GrayScale.gray10)
                                .padding(.horizontal, 3)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .pickerStyle(.inline)

                    Text(" : ")

                    Picker("OutingMinuteTime", selection: $selectedTime.arrivalMinute) {
                        ForEach(0 ..< 60) { num in
                            Text("\(num)")
                                .dmsFont(.body(.body1), color: .GrayScale.gray10)
                                .padding(.horizontal, 3)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .pickerStyle(.inline)

                    Spacer()
                }
                .padding(.vertical, 7)
                .cornerRadius(4)
            }

            DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                viewModel.outingHourSelectTime = selectedTime.outingHour + 1
                viewModel.outingMinuteSelectTime = selectedTime.outingMinute
                viewModel.arrivalHourSelectTime = selectedTime.arrivalHour + 1
                viewModel.arrivalMinuteSelectTime = selectedTime.arrivalMinute
                timeText = viewModel.outingApplicationTime
                viewModel.outingApplicationTimeStatus = true
                viewModel.isShowingOutingTimePickerBottomSheet = false
            }
            .dmsFont(.etc(.button))
            .padding(.top, 30)
        }
        .padding(.horizontal, 20)
    }
}
