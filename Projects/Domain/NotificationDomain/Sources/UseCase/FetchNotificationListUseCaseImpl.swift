import Combine
import NotificationDomainInterface

public struct FetchNotificationListUseCaseImpl: FetchNotificationListUseCase {
    private let notificationRepository: any NotificationRepository

    public init(notificationRepository: any NotificationRepository) {
        self.notificationRepository = notificationRepository
    }

    public func execute() -> AnyPublisher<Void, Error> {
        notificationRepository.fetchNotificationList()
    }
}
