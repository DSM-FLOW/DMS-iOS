import Combine
import OutingDomainInterface

public struct OutingRepositoryImpl: OutingRepository {
    private let remoteOutingDataSource: any RemoteOutingDataSource

    public init(remoteOutingDataSource: any RemoteOutingDataSource) {
        self.remoteOutingDataSource = remoteOutingDataSource
    }

    public func fetchMyOutingApplicationItem() -> AnyPublisher<MyOutingApplicationItemEntity, Error> {
        remoteOutingDataSource.fetchMyOutingApplicationItem()
    }

    public func fetchOutingAvailableTime(dayOfWeek: String) -> AnyPublisher<[OutingEntity], Error> {
        remoteOutingDataSource.fetchOutingAvailableTime(dayOfWeek: dayOfWeek)
    }

    public func fetchOutingType() -> AnyPublisher<OutingTypeEntity, Error> {
        remoteOutingDataSource.fetchOutingType()
    }

    public func deleteOutingApplicationItem(id: String) -> AnyPublisher<Void, Error> {
        remoteOutingDataSource.deleteOutingApplicationItem(id: id)
    }

    public func outingApplication(req: OutingApplicationRequestDTO) -> AnyPublisher<OutingApplicationEntity, Error> {
        remoteOutingDataSource.outingApplication(req: req)
    }
}
