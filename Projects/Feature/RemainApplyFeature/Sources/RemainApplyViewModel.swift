import RemainsDomainInterface
import BaseFeature
import SwiftUI

final class RemainApplyViewModel: BaseViewModel {

    @Published var isShowingErrorToast = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var remainsAvailableTime: RemainsAvailableTimeEntity?
    @Published var remainApplicationList = RemainApplicationListEntity(remainOptions: [])
    @Published var myRemainsApplicationItems: MyRemainApplicationItemsEntity?
    @Published var selectedEntity: RemainOptionEntity?

    var rangeString: String {
        if let time = remainsAvailableTime {
            let startString = "\(time.startDayOfWeek.displayString()) \(time.startTime)"
            let endString = "\(time.endDayOfWeek.displayString()) \(time.endTime)"
            let text = "잔류 신청 시간은 \(startString) ~ \(endString) 까지 입니다."
            return text
        } else {
            return ""
        }
    }

    var buttonTitle: String {
        if let selectedEntity {
            if selectedEntity.title == myRemainsApplicationItems?.title {
                return "신청 완료"
            } else if myRemainsApplicationItems == nil {
                return selectedEntity.title + " 신청하기"
            } else {
                return selectedEntity.title + "로 변경하기"
            }
        } else {
            return ""
        }
    }

    private let fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase
    private let fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase
    private let fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase
    private let remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase

    public init(
        fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase,
        fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase,
        fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase,
        remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase
    ) {
        self.fetchMyRemainApplicationItemsUseCase = fetchMyRemainApplicationItemsUseCase
        self.fetchRemainApplicationListUseCase = fetchRemainApplicationListUseCase
        self.fetchRemainsAvailableTimeUseCase = fetchRemainsAvailableTimeUseCase
        self.remainingApplicationsChangesUseCase = remainingApplicationsChangesUseCase
    }

    private func fetchRemainsAvailableTime() {
        addCancellable(
            fetchRemainsAvailableTimeUseCase.execute()
        ) { [weak self] remainsAvailableTime  in
            self?.remainsAvailableTime = remainsAvailableTime
        }
    }

    func fetchRemainApplicationList() {
        addCancellable(
            fetchRemainApplicationListUseCase.execute()
        ) { [weak self] remainApplicationList in
            self?.remainApplicationList = remainApplicationList
        }
    }

    func changeRemainApply() {
        if let selectedEntity {
            remainingApplicationsChanges(
                entity: selectedEntity
            )
        }
    }

    private func remainingApplicationsChanges(entity: RemainOptionEntity) {
        addCancellable(
            remainingApplicationsChangesUseCase.execute(id: entity.id)
        ) { [weak self] _ in
            let remainOptions = self?.remainApplicationList.remainOptions
                .map {
                    return RemainOptionEntity(
                        id: $0.id,
                        title: $0.title,
                        description: $0.description,
                        isApplied: entity.id == $0.id
                    )
                }
            self?.remainApplicationList = RemainApplicationListEntity(remainOptions: remainOptions ?? [])
            self?.myRemainsApplicationItems?.title = entity.title
            self?.toastMessage = "잔류 신청이 완료되었습니다."
            self?.isShowingToast = true
            self?.fetchMyRemainApplicationItems()
        } onReceiveError: { [weak self] _ in
            self?.toastMessage = "잔류 신청 시간이 아닙니다."
            self?.isShowingErrorToast = true
        }
    }

    private func fetchMyRemainApplicationItems() {
        addCancellable(
            fetchMyRemainApplicationItemsUseCase.execute()
        ) { [weak self] myRemainsApplicationItems in
            self?.myRemainsApplicationItems = myRemainsApplicationItems
        }
    }

    func onAppear() {
        fetchRemainsAvailableTime()
        fetchMyRemainApplicationItems()
    }

    func refresh() {
        fetchRemainsAvailableTime()
        fetchMyRemainApplicationItems()
    }
}
