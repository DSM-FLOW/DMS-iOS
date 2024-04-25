import NeedleFoundation
import StudentsDomain
import StudentsDomainInterface

public extension AppComponent {
    var remoteStudentsDataSource: any RemoteStudentsDataSource {
        shared {
//            RemoteStudentsDataSourceStub()
            RemoteStudentsDataSourceImpl(keychain: keychain)
        }
    }

    var studentsRepository: any StudentsRepository {
        shared {
            StudentsRepositoryImpl(remoteStudentsDataSource: remoteStudentsDataSource)
        }
    }

    var signupUseCase: any SignupUseCase {
        shared {
            SignupUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var checkDuplicateAccountIDUseCase: any CheckDuplicateAccountIDUseCase {
        shared {
            CheckDuplicateAccountIDUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase {
        shared {
            CheckDuplicateEmailUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var renewalPasswordUseCase: any RenewalPasswordUseCase {
        shared {
            RenewalPasswordUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var findIDUseCase: any FindIDUseCase {
        shared {
            FindIDUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase {
        shared {
            CheckExistGradeClassNumberUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        shared {
            FetchMyProfileUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var changeProfileImageUseCase: any ChangeProfileImageUseCase {
        shared {
            ChangeProfileImageUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var withdrawalUseCase: any WithdrawalUseCase {
        shared {
            WithdrawalUseCaseImpl(studentsRepository: studentsRepository)
        }
    }

    var fetchAllStudentUseCase: any FetchAllStudentUseCase {
        shared {
            FetchAllStudentUseCaseImpl(studentsRepository: studentsRepository)
        }
    }
}
