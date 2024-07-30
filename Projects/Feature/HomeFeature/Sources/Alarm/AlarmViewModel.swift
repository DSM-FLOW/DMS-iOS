import BaseFeature
import Combine
import Foundation
import UtilityModule
import NotificationDomainInterface
import SwiftUI

final class AlarmViewModel: BaseViewModel {

    private let fetchNotificationListUseCase: any FetchNotificationListUseCase

    init(
        fetchNotificationListUseCase: any FetchNotificationListUseCase
    ) {
        self.fetchNotificationListUseCase = fetchNotificationListUseCase
        super.init()
    }

    func onAppear() {
        addCancellable(
            fetchNotificationListUseCase.execute()
        ) { [weak self] _ in
            print("리스트 들어옴")
        }
//        addCancellable(
//            fetchNoticeListUseCase.execute(
//                order: noticeOrderType
//            )
//        ) { [weak self]  noticeList in
//            self?.noticeList = noticeList
//        }
    }
}
