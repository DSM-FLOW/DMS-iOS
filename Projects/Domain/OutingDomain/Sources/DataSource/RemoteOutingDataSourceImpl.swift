import Combine
import BaseDomain
import OutingDomainInterface

public final class RemoteOutingDataSourceImpl: BaseRemoteDataSource<OutingAPI>, RemoteOutingDataSource {
    public func fetchMyOutingApplicationItem() -> AnyPublisher<MyOutingApplicationItemEntity, Error> {
        request(.fetchMyOutingApplicationItem, dto: MyOutingApplicationItemResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchOutingAvailableTime(dayOfWeek: String) -> AnyPublisher<[OutingEntity], Error> {
        request(.fetchOutingAvailableTime(dayOfWeek: dayOfWeek), dto: FetchOutingAvailableTimeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchOutingType() -> AnyPublisher<OutingTypeEntity, Error> {
        request(.fetchOutingType, dto: FetchOutingTypeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func deleteOutingApplicationItem(id: String) -> AnyPublisher<Void, Error> {
        request(.deleteOutingApplicationItem(id: id))
            .eraseToAnyPublisher()
    }

    public func outingApplication(req: OutingApplicationRequestDTO) -> AnyPublisher<OutingApplicationEntity, Error> {
        request(.outingApplication(req), dto: OutingApplicationResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
