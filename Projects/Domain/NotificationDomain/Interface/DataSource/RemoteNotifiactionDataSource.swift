import Combine

public protocol RemoteNotificationDataSource {
    func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
    func unsubscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
    func fetchNotificationList() -> AnyPublisher<Void, Error>
}
