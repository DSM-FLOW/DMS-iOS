import Combine

public protocol UnsubscribeTopicUseCase {
    func execute(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
}
