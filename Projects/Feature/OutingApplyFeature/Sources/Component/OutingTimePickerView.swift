import DesignSystem
import SwiftUI

struct OutingTimePickerView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Binding var timeText: String
    @State var outingHourTimeList = Array(1...24)
    @State var outingMinuteTimeList = Array(0...59)
    @State var arrivalHourTimeList = Array(1...24)
    @State var arrivalMinuteTimeList = Array(0...59)
    @State var outingHourSelectTime: Int = 0
    @State var outingMinuteSelectTime: Int = 0
    @State var arrivalHourSelectTime: Int = 0
    @State var arrivalMinuteSelectTime: Int = 0
    @State var isPressed = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Picker("OutingHourTime", selection: $outingHourSelectTime) {
                    ForEach(0 ..< outingHourTimeList.count) {
                        Text("\(outingHourTimeList[$0])")
                            .padding(.horizontal, 10)
                    }
                }
                .pickerStyle(.inline)
                Text(" : ")
                Picker("OutingMinuteTime", selection: $outingMinuteSelectTime) {
                    ForEach(0 ..< outingMinuteTimeList.count) {
                        Text("\(outingMinuteTimeList[$0])")
                            .padding(.horizontal, 10)
                    }
                }
                .pickerStyle(.inline)
                Text(" ~ ")
                Picker("arrivalHourTime", selection: $arrivalHourSelectTime) {
                    ForEach(0 ..< arrivalHourTimeList.count) {
                        Text("\(arrivalHourTimeList[$0])")
                            .padding(.horizontal, 10)
                    }
                }
                .pickerStyle(.inline)
                Text(" : ")
                Picker("OutingMinuteTime", selection: $arrivalMinuteSelectTime) {
                    ForEach(0 ..< arrivalMinuteTimeList.count) {
                        Text("\(arrivalMinuteTimeList[$0])")
                            .padding(.horizontal, 10)
                    }
                }
                .pickerStyle(.inline)
            }
            .padding(.horizontal, 6)
            DMSWideButton(text: "확인", color: .PrimaryVariant.primary, action: {
                viewModel.outingHourSelectTime = outingHourSelectTime + 1
                viewModel.outingMinuteSelectTime = outingMinuteSelectTime
                viewModel.arrivalHourSelectTime = arrivalHourSelectTime + 1
                viewModel.arrivalMinuteSelectTime = arrivalMinuteSelectTime
                timeText = viewModel.outingApplicationTime
                viewModel.outingApplicationTimeStatus = true
            })
                .padding(.top, 30)
                .padding(.horizontal, 24)
        }
    }
}
