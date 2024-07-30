import Combine
import NotificationDomainInterface

public struct NotificationRepositoryImpl: NotificationRepository {
    private let remoteNotificationDataSource: any RemoteNotificationDataSource

    public init(remoteNotificationDataSource: any RemoteNotificationDataSource) {
        self.remoteNotificationDataSource = remoteNotificationDataSource
    }

    public func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        remoteNotificationDataSource.subscribeTopic(token: token, topic: topic)
    }

    public func unsubscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        remoteNotificationDataSource.unsubscribeTopic(token: token, topic: topic)
    }

    public func fetchNotificationList() -> AnyPublisher<Void, Error> {
        remoteNotificationDataSource.fetchNotificationList()
    }
}
