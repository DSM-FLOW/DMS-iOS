import NotificationDomainInterface
import BaseDomain
import Combine

public final class RemoteNotificationDataSourceImpl:
    BaseRemoteDataSource<NotificationAPI>, RemoteNotificationDataSource {
    public func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        request(.subscribeTopic(token: token, topic: topic))
    }

    public func unsubscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        request(.unsubscribeTopic(token: token, topic: topic))
    }

    public func fetchNotificationList() -> AnyPublisher<Void, Error> {
        request(.fetchNotificationList)
    }
}
