//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 10/12/23.
//

import SwiftUI
import WidgetKit


struct Expense_TrackerApp: App {
    @Environment(\.scenePhase) private var scene
    /// User Theme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate
    /// Notification Properties
    @AppStorage("enableNotifications") private var enableNotifications: Bool = false
    @AppStorage("notificationAccess") private var isNotificationAccessGiven: NotificationState = .notDetermined
    var body: some Scene {
        WindowGroup {
            TrackerContentView()
                /// Reloading Widgets
                .onChange(of: scene, initial: true, { oldValue, newValue in
                    if newValue == .background {
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                    
                    verifyNotificationAccess()
                })
                .preferredColorScheme(userTheme.colorScheme)
        }
        .modelContainer(for: [Transaction.self])
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
