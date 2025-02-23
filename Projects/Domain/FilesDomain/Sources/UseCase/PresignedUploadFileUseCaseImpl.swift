import Foundation
import Combine
import FilesDomainInterface

public struct PresignedUploadFileUseCaseImpl: PresignedUploadFileUseCase {
    private let presignedRepository: any PresignedRepository

    public init(presignedRepository: any PresignedRepository) {
        self.presignedRepository = presignedRepository
    }

    public func execute(uploadURL: String, data: Data) -> AnyPublisher<Void, Error> {
        presignedRepository.presignedUploadFile(uploadURL: uploadURL, data: data)
    }
}
