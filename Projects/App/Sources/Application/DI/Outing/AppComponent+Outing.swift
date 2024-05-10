import NeedleFoundation
import OutingDomain
import OutingDomainInterface

public extension AppComponent {
    var remoteOutingDataSource: any RemoteOutingDataSource {
        shared {
            RemoteOutingDataSourceImpl(keychain: keychain)
        }
    }

    var outingRepository: any OutingRepository {
        shared {
            OutingRepositoryImpl(remoteOutingDataSource: remoteOutingDataSource)
        }
    }

    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase {
        shared {
            FetchMyOutingApplicationItemUseCaseImpl(outingRepository: outingRepository)
        }
    }

    var fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase {
        shared {
            FetchOutingAvailableTimeUseCaseImpl(outingRepository: outingRepository)
        }
    }

    var fetchOutingTypeUseCase: any FetchOutingTypeUseCase {
        shared {
            FetchOutingTypeUseCaseImpl(outingRepository: outingRepository)
        }
    }

    var deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase {
        shared {
            DeleteOutingApplicationItemUseCaseImpl(outingRepository: outingRepository)
        }
    }

    var outingApplicationUseCase: any OutingApplicationUseCase {
        shared {
            OutingApplicationUseCaseImpl(outingRepository: outingRepository)
        }
    }
}
