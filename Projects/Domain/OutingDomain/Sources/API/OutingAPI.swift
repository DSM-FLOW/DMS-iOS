import OutingDomainInterface
import BaseDomain
import Moya

public enum OutingAPI {
    case fetchMyOutingApplicationItem
    case fetchOutingAvailableTime(dayOfWeek: String)
    case fetchOutingType
    case deleteOutingApplicationItem(id: String)
    case outingApplication(OutingApplicationRequestDTO)
}

extension OutingAPI: DmsAPI {
    public typealias ErrorType = OutingDomainError

    public var domain: DmsDomain {
        .outings
    }

    public var urlPath: String {
        switch self {
        case .fetchMyOutingApplicationItem:
            return "/my"

        case .fetchOutingAvailableTime:
            return "/available-time"

        case .fetchOutingType:
            return "/types"

        case let .deleteOutingApplicationItem(id):
            return "/\(id)"

        case .outingApplication:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .deleteOutingApplicationItem:
            return .delete

        case .outingApplication:
            return .post

        default:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchOutingAvailableTime(dayOfWeek):
            return .requestParameters(parameters: [
                "dayOfWeek": dayOfWeek
            ], encoding: URLEncoding.queryString)

        case let .outingApplication(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchMyOutingApplicationItem, .fetchOutingAvailableTime, .fetchOutingType,
                .deleteOutingApplicationItem, .outingApplication:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .forbidden,
                404: .notFound,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
