import AppSettingsKit
import SwiftUI

@main
struct MainAppApp: App {
    //let viewModel: Kit.SettingsViewModel = .init(route: .profile)
    //@State var openSupport = false
    @Environment(\.scenePhase) private var scene
    /// User Theme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate
    /// Notification Properties
    @AppStorage("enableNotifications") private var enableNotifications: Bool = false
    @AppStorage("notificationAccess") private var isNotificationAccessGiven: NotificationState = .notDetermined
    var body: some Scene {
        WindowGroup {
            Kit.HomeScreen(viewModel: .init())

        }
    }
    
    /// Verifying Notification Access
    func verifyNotificationAccess() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                isNotificationAccessGiven = .notDetermined
            case .denied:
                isNotificationAccessGiven = .denied
            case .authorized:
                isNotificationAccessGiven = .approved
            default:
                isNotificationAccessGiven = .notDetermined
            }
            
            /// Removing all pending notifications if the notifcation access is revoked!
            if isNotificationAccessGiven == .denied && enableNotifications {
                enableNotifications = false
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
    }
}

/// App Delegate
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner])
    }
}

#warning("code to test Supporter library")
//            NavigationView {
//                Kit.HomeScreen(viewModel: .init())
//                    .toolbar {
//                        ToolbarItem {
//                            Button {
//                                openSupport.toggle()
//                            } label: {
//                                Image(systemName: "questionmark.circle.fill")
//                            }
//                        }
//                    }
//                    .fullScreenCover(isPresented: $openSupport) {
//                        SupportScreen()
//                    }
//            }
