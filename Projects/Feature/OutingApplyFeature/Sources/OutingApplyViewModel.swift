import UtilityModule
import OutingDomainInterface
import StudentsDomainInterface
import BaseFeature
import SwiftUI

final class OutingApplyViewModel: BaseViewModel {
    @Published var isPresentedDeleteOutingItemAlert = false
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
    let changeTime: DateComponents = DateComponents(hour: 18, minute: 0)

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

    /// MyOutingApplicationItem
    @Published var outingTypeTitle = ""
    @Published var outingDate = ""
    @Published var startTime = ""
    @Published var endTime = ""
    @Published var outingCompanions = ""
    @Published var outingReason = ""
    @Published var outingId = ""

    // fetchOutingTypeUseCase
    @Published var outingTypeTitles: [String] = []

    // fetchAllStudentUseCase
    @Published var studentName = ""
    @Published var students: [StudentEntity] = []
    @Published var selectStudent: [StudentEntity] = []
    @Published var selectedStudentString: [String] = []

    @Published var myOutingApplicationItem: MyOutingApplicationItemEntity?
    @Published var outingType: OutingTypeEntity?

    @Published var isShowingErrorToast = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var isApplied = false
    @Published var isShowingBottomSheet: Bool = false
    @Published var isShowingOutingTimePickerBottomSheet: Bool = false

    /// OutingApplication
    @Published var isSuccessOutingApplication = false
    @Published var outingApplicationDate: String = Date().toOutingApplicationDMSDateString()
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
    private let fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase
    private let fetchOutingTypeUseCase: any FetchOutingTypeUseCase
    private let deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase
    private let fetchAllStudentsUseCase: any FetchAllStudentsUseCase
    private let outingApplicationUseCase: any OutingApplicationUseCase

    init(
        fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase,
        fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase,
        fetchOutingTypeUseCase: any FetchOutingTypeUseCase,
        deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase,
        fetchAllStudentsUseCase: any FetchAllStudentsUseCase,
        outingApplicationUseCase: any OutingApplicationUseCase
    ) {
        self.fetchOutingAvailableTimeUseCase = fetchOutingAvailableTimeUseCase
        self.fetchMyOutingApplicationItemUseCase = fetchMyOutingApplicationItemUseCase
        self.fetchOutingTypeUseCase = fetchOutingTypeUseCase
        self.deleteOutingApplicationItemUseCase = deleteOutingApplicationItemUseCase
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
            fetchMyOutingApplicationItemUseCase.execute()
        ) { [weak self] myOutingApplicationItem in
            var string: String?
            myOutingApplicationItem.companions.forEach {
                string = (string ?? "") + $0 + ","
            }

            self?.outingId = "\(myOutingApplicationItem.id)"
            self?.outingTypeTitle = myOutingApplicationItem.titleType
            self?.outingDate = "\(myOutingApplicationItem.date)"
            self?.startTime = myOutingApplicationItem.outingTime
            self?.endTime = myOutingApplicationItem.arrivalTime
            self?.outingCompanions = string ?? ""
            self?.outingReason = myOutingApplicationItem.reason ?? "없음"

            if myOutingApplicationItem.status == "APPROVED" {
                self?.isApplied = true
            } else {
                self?.isApplied = false
            }
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

    func deleteOutingApplicationItemButtonDidClicked() {
        isPresentedDeleteOutingItemAlert = true
    }

    func confirmDeleteOutingApplicationItemButtonDidClicked() {
        addCancellable(
            deleteOutingApplicationItemUseCase.execute(id: outingId)
        ) { [weak self] _ in
            self?.isSuccessOutingApplication = true
            self?.toastMessage = "외출 신청이 취소되었습니다."
            self?.isShowingToast = true
        }
    }

    func outingApplicationItemButtonDidClicked() {
        isPresentedOutingItemAlert = true
    }

    func confirmOutingApplicationItemButtonDidClicked() {
        addCancellable(
            outingApplicationUseCase.execute(
                req: .init(
                    date: outingApplicationDate,
                    outingTime: outingApplicationTimeDate,
                    arrivalTime: arrivalApplicationTimeDate,
                    titleType: outingTypeTitleApplication,
                    reason: outingReasonApplication,
                    companionIds: companionIdsApplication
                )
            )
        ) { [weak self] _ in
            self?.isSuccessOutingApplication = true
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
            return calendar.date(byAdding: .day, value: 1, to: now)!
        } else {
            return now
        }
    }
}
