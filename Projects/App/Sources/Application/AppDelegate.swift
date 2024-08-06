import DesignSystem
import Foundation
import Keychain
import UIKit
import WatchConnectivity
import Firebase
import FirebaseCore

final class AppDelegate: UIResponder, UIApplicationDelegate {
    var session: WCSession!
    var keychain: (any Keychain)?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        self.session = .default
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
        DesignSystemFontFamily.registerAllCustomFonts()

        // 파이어베이스 설정
        FirebaseApp.configure()

        // 앱 실행 시 사용자에게 알림 허용 권한을 받음
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound] // 필요한 알림 권한을 설정
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )

        // UNUserNotificationCenterDelegate를 구현한 메서드를 실행시킴
        application.registerForRemoteNotifications()

        // 파이어베이스 Meesaging 설정
        Messaging.messaging().delegate = self

        return true
    }
}

extension AppDelegate: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) { }

    func sessionDidDeactivate(_ session: WCSession) { }

    func session(
        _ session: WCSession,
        didReceiveMessage message: [String: Any],
        replyHandler: @escaping ([String: Any]) -> Void
    ) {
        guard let keychain else {
            return
        }

        let message: [String: Any] = [
            "accessToken": keychain.load(type: .accessToken),
            "accessExpiredAt": keychain.load(type: .accessExpiredAt)
        ]
        replyHandler(message)
    }

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        guard let keychain else {
            return
        }

        let message: [String: Any] = [
            "accessToken": keychain.load(type: .accessToken),
            "accessExpiredAt": keychain.load(type: .accessExpiredAt)
        ]
        sendMessage(message: message) { _ in } error: { error in
            print(error.localizedDescription)
        }
    }
}

private extension AppDelegate {
    func sendMessage(
        message: [String: Any],
        reply: @escaping ([String: Any]) -> Void,
        error: ((Error) -> Void)? = nil
    ) {
        guard session.activationState == .activated else {
            return
        }
        session.sendMessage(message, replyHandler: reply, errorHandler: error)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    // 백그라운드에서 푸시 알림을 탭했을 때 실행
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        Messaging.messaging().apnsToken = deviceToken
    }

    // Foreground(앱 켜진 상태)에서도 알림 오는 설정
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.list, .banner])
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(
        _ messaging: Messaging,
        didReceiveRegistrationToken fcmToken: String?
    ) {
        let token = String(describing: fcmToken)

        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
    }
}
