import Foundation
import FamilyControls
import ManagedSettings

@available(iOS 16.0, *)
class ScreenTimeManager {

    static let shared = ScreenTimeManager()

    private let store = ManagedSettingsStore()

    // Request permission
    func requestPermission(completion: @escaping (Bool) -> Void) {
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
                completion(true)
            } catch {
                completion(false)
            }
        }
    }

    // Block app by bundleId
    func blockApp(bundleId: String) {
        let app = ApplicationToken(bundleIdentifier: bundleId)
        store.shield.applications = [app]
    }

    // Unblock all apps
    func unblockAll() {
        store.shield.applications = nil
    }
}
