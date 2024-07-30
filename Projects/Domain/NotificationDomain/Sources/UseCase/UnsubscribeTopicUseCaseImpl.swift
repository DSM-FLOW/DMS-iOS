import Combine
import NotificationDomainInterface

public struct UnsubscribeTopicUseCaseImpl: UnsubscribeTopicUseCase {
    private let notificationRepository: any NotificationRepository

    public init(notificationRepository: any NotificationRepository) {
        self.notificationRepository = notificationRepository
    }

    public func execute(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        notificationRepository.unsubscribeTopic(token: token, topic: topic)
    }
}
