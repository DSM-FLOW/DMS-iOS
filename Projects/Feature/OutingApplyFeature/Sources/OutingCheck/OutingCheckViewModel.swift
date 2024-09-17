import UtilityModule
import OutingDomainInterface
import BaseFeature
import SwiftUI

final class OutingCheckViewModel: BaseViewModel {
    @Published var isPresentedDeleteOutingItemAlert = false
    @Published var isPresentedOutingItemAlert = false

    @Published var isApplied = false
    @Published var isShowingErrorToast = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    /// MyOutingApplicationItem
    @Published var outingTypeTitle = ""
    @Published var outingDate = ""
    @Published var startTime = ""
    @Published var endTime = ""
    @Published var outingCompanions = ""
    @Published var outingReason = ""
    @Published var outingId = ""

    @Published var isSuccessOutingApplication = false

    private let fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase
    private let deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase

    init(
        fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase,
        deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase
    ) {
        self.fetchMyOutingApplicationItemUseCase = fetchMyOutingApplicationItemUseCase
        self.deleteOutingApplicationItemUseCase = deleteOutingApplicationItemUseCase
    }

    func onAppear() {
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
}
