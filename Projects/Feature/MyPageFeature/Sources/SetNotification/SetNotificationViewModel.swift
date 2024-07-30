import BaseFeature
import NotificationDomainInterface
import Combine

final class SetNotificationViewModel: BaseViewModel {
    private let subscribeTopicUseCase: any SubscribeTopicUseCase
    private let unsubscribeTopicUseCase: any UnsubscribeTopicUseCase
    @Published var isNoticeOn = false {
        didSet {
            noticeToggleButtonDidClicked()
        }
    }
    @Published var isTimeSlotOn = false {
        didSet {
            timeSlotToggleButtonDidClicked()
        }
    }
    @Published var isAvailableTimeOn = false {
        didSet {
            availableTimeToggleButtonDidClicked()
        }
    }
    @Published var isRewardOn = false {
        didSet {
            rewardToggleButtonDidClicked()
        }
    }
    @Published var isOutingOn = false {
        didSet {
            outingToggleButtonDidClicked()
        }
    }

    public init(
        subscribeTopicUseCase: any SubscribeTopicUseCase,
        unsubscribeTopicUseCase: any UnsubscribeTopicUseCase
    ) {
        self.subscribeTopicUseCase = subscribeTopicUseCase
        self.unsubscribeTopicUseCase = unsubscribeTopicUseCase
    }

    func noticeToggleButtonDidClicked() {
        if isNoticeOn {
            print("noticeToggleButtonDidClicked~!")
            print("true")
//            addCancellable(
//                subscribeTopicUseCase.execute(
//                    token: "",
//                    topic: .notice
//                )
//            )
        } else {
            print("noticeToggleButtonDidClicked~!")
            print("false")
//            addCancellable(
//                unsubscribeTopicUseCase.execute(
//                    token: "",
//                    topic: .notice
//                )
//            )
        }
    }

    func timeSlotToggleButtonDidClicked() {
        if isTimeSlotOn {
            print("timeSlotToggleButtonDidClicked~!")
            print("true")
        } else {
            print("timeSlotToggleButtonDidClicked~!")
            print("false")
        }
    }

    func availableTimeToggleButtonDidClicked() {
        if isAvailableTimeOn {
            print("availableTimeToggleButtonDidClicked~!")
            print("true")
        } else {
            print("availableTimeToggleButtonDidClicked~!")
            print("false")
        }
    }

    func rewardToggleButtonDidClicked() {
        if isRewardOn {
            print("rewardToggleButtonDidClicked~!")
            print("true")
        } else {
            print("rewardToggleButtonDidClicked~!")
            print("false")
        }
    }

    func outingToggleButtonDidClicked() {
        if isOutingOn {
            print("outingToggleButtonDidClicked~!")
            print("true")
        } else {
            print("outingToggleButtonDidClicked~!")
            print("false")
        }
    }
}
