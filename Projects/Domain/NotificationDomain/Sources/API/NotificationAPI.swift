import NotificationDomainInterface
import BaseDomain
import Moya

public enum NotificationAPI {
    case subscribeTopic(token: String, topic: TopicType)
    case unsubscribeTopic(token: String, topic: TopicType)
    case fetchNotificationList
}

extension NotificationAPI: DmsAPI {
    public typealias ErrorType = NotificationDomainError

    public var domain: DmsDomain {
        .notifications
    }

    public var urlPath: String {
        switch self {
        case .subscribeTopic:
            return "/topic"
        case .unsubscribeTopic:
            return "/topic"
        case .fetchNotificationList:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .subscribeTopic:
            return .post
        case .fetchNotificationList:
            return .get
        case .unsubscribeTopic:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .subscribeTopic(token, topic):
            return .requestParameters(
                parameters: [
                    "token": token,
                    "topic": topic
                ],
                encoding: JSONEncoding.default
            )
        case let .unsubscribeTopic(token, topic):
            return .requestParameters(
                parameters: [
                    "token": token,
                    "topic": topic
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .subscribeTopic, .fetchNotificationList, .unsubscribeTopic:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
