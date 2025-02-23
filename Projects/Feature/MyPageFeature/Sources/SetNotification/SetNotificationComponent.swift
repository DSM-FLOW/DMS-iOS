import SwiftUI
import MyPageFeatureInterface
import NeedleFoundation
import NotificationDomainInterface

public protocol SetNotificationDependency: Dependency {
    var subscribeTopicUseCase: any SubscribeTopicUseCase { get }
}

public final class SetNotificationComponent: Component<SetNotificationDependency>, SetNotificationFactory {
    public func makeView() -> some View {
        SetNotificationView(
            viewModel: .init(
                subscribeTopicUseCase: self.dependency.subscribeTopicUseCase
            )
        )
    }
}
