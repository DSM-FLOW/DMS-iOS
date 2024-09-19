import UtilityModule
import OutingDomainInterface
import StudentsDomainInterface
import BaseFeature
import SwiftUI

final class OutingApplyViewModel: BaseViewModel {
    @Published var isPresentedOutingItemAlert = false

    /// 필수 사항 Status
    @Published var outingApplicationTimeStatus = false
    @Published var outingTypeTitleApplicationStatus = false

    /// TimeSelect 변수
    @Published var outingHourSelectTime = 0
    @Published var outingMinuteSelectTime = 0
    @Published var arrivalHourSelectTime = 0
    @Published var arrivalMinuteSelectTime = 0
    var outingApplicationTime: String {
        return "\(outingHourSelectTime):\(outingMinuteSelectTime) ~ \(arrivalHourSelectTime):\(arrivalMinuteSelectTime)"
    }

    @State var currentDate: Date = Date()
    let changeTime: DateComponents = DateComponents(hour: 13, minute: 0)

    /// AvailableTime
    @Published var outingAvailableTime: [OutingEntity] = []
    var currentDayOfWeek: String {
        let date = Date()
        return date.dayOfWeekUpper()
    }
    var dateType: String {
        switch currentDayOfWeek {
            case "MONDAY":
                return "월"
            case "TUESDAY":
                return "화"
            case "WEDNESDAY":
                return "수"
            case "THURSDAY":
                return "목"
            case "FRIDAY":
                return "금"
            case "SATURDAY":
                return "토"
            case "SUNDAY":
                return "일"
            default:
                return ""
            }
        }

    /// fetchOutingTypeUseCase
    @Published var outingTypeTitles: [String] = []

    /// fetchAllStudentUseCase
    @Published var studentName = ""
    @Published var students: [StudentEntity] = []
    @Published var selectStudent: [StudentEntity] = []
    @Published var selectedStudentString: [String] = []

    /// toast
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var isShowingBottomSheet: Bool = false
    @Published var isShowingOutingTimePickerBottomSheet: Bool = false

    /// OutingApplication
    var outingApplicationDate: Date {
        let now = Date()
        let calendar = Calendar.current
        let changeDateTime = calendar.date(
            bySettingHour: changeTime.hour!,
            minute: changeTime.minute!,
            second: 0, of: now
        )!

        if now >= changeDateTime {
            return calendar.date(byAdding: .day, value: 1, to: now) ?? Date()
        } else {
            return now
        }
    }

    var outingApplicationTimeDate: String {
        let outingTime: String = String(format: "%02d:%02d", outingHourSelectTime, outingMinuteSelectTime)
        return outingTime
    }
    var arrivalApplicationTimeDate: String {
        let arrivalTime: String = String(format: "%02d:%02d", arrivalHourSelectTime, arrivalMinuteSelectTime)
        return arrivalTime
    }

    @Published var companionIdsApplication: [String] = []
    @Published var outingTypeTitleApplication = ""
    @Published var outingReasonApplication = ""
    @Published var companionGradeClassNumber: [String] = []
    @Published var companionProfileImage: [String] = []
    var outingCompanionName: String {
        if selectedStudentString.isEmpty {
            return "없음"
        } else if selectedStudentString.count == 1 {
            return "\(selectedStudentString[0])"
        } else {
            return "\(selectedStudentString[0]) 외 \(selectedStudentString.count-1)명"
        }
    }

    private let fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase
    private let fetchOutingTypeUseCase: any FetchOutingTypeUseCase
    private let fetchAllStudentsUseCase: any FetchAllStudentsUseCase
    private let outingApplicationUseCase: any OutingApplicationUseCase

    init(
        fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase,
        fetchOutingTypeUseCase: any FetchOutingTypeUseCase,
        fetchAllStudentsUseCase: any FetchAllStudentsUseCase,
        outingApplicationUseCase: any OutingApplicationUseCase
    ) {
        self.fetchOutingAvailableTimeUseCase = fetchOutingAvailableTimeUseCase
        self.fetchOutingTypeUseCase = fetchOutingTypeUseCase
        self.fetchAllStudentsUseCase = fetchAllStudentsUseCase
        self.outingApplicationUseCase = outingApplicationUseCase
    }

    func onAppear() {
        addCancellable(
            fetchOutingAvailableTimeUseCase.execute(
                dayOfWeek: currentDayOfWeek
            )
        ) { [weak self] outingAvailableTime in
            self?.outingAvailableTime = outingAvailableTime
        }

        addCancellable(
            fetchOutingTypeUseCase.execute()
        ) { [weak self] outingType in
            self?.outingTypeTitles = outingType.titleType
        }

        addCancellable(
            fetchAllStudentsUseCase.execute(
                name: studentName
            )
        ) { [weak self] students in
            self?.students = students
        }
    }

    func outingApplicationItemButtonDidClicked() {
        isPresentedOutingItemAlert = true
    }

    func confirmOutingApplicationItemButtonDidClicked() {
        addCancellable(
            outingApplicationUseCase.execute(
                req: .init(
                    date: outingApplicationDate.toSmallDMSDateString(),
                    outingTime: outingApplicationTimeDate,
                    arrivalTime: arrivalApplicationTimeDate,
                    titleType: outingTypeTitleApplication,
                    reason: outingReasonApplication,
                    companionIds: companionIdsApplication
                )
            )
        ) { [weak self] _ in
            self?.toastMessage = "외출 신청이 완료되었습니다.\n사감선생님께서 승인하면 외출증이 출력됩니다."
            self?.isShowingToast = true
        }
    }

    func searchStudentInfo() {
        addCancellable(
            fetchAllStudentsUseCase.execute(
                name: studentName
            )
        ) { [weak self] students in
            self?.students = students
        }
    }

    func insertSelectedStudent(studentInfo: StudentEntity, name: String, id: String, gradeClassNumber: String) {
        self.selectStudent.append(studentInfo)
        self.selectedStudentString.append(name)
        self.companionIdsApplication.append(id)
        self.companionGradeClassNumber.append(gradeClassNumber)
    }

    func deleteSelectedStudent(
        studentInfo: StudentEntity,
        name: String,
        gradeClassNumber: String,
        id: String
    ) {
        self.selectStudent.removeAll { $0 == studentInfo }
        self.selectedStudentString.removeAll { $0 == name }
        self.companionIdsApplication.removeAll { $0 == id }
        self.companionGradeClassNumber.removeAll { $0 == gradeClassNumber }
    }

    func displayDate() -> Date {
        let now = Date()
        let calendar = Calendar.current
        let changeDateTime = calendar.date(
            bySettingHour: changeTime.hour!,
            minute: changeTime.minute!,
            second: 0, of: now
        )!

        if now >= changeDateTime {
            return calendar.date(byAdding: .day, value: 1, to: now) ?? Date()
        } else {
            return now
        }
    }
}
