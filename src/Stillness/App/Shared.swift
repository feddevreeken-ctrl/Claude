import Foundation
import FamilyControls
import ManagedSettings

/// State shared between the app, the Focus filter and the shield extension.
enum Shared {
    static let group = "group.com.example.stillness"
    static let defaults = UserDefaults(suiteName: group) ?? .standard
    private static let key = "allowedSelection"

    static var allowed: FamilyActivitySelection {
        get {
            guard let data = defaults.data(forKey: key),
                  let sel = try? JSONDecoder().decode(FamilyActivitySelection.self, from: data)
            else { return FamilyActivitySelection() }
            return sel
        }
        set { defaults.set(try? JSONEncoder().encode(newValue), forKey: key) }
    }
}

/// Blocks every app/website except the ones you allow.
enum Blocker {
    private static let store = ManagedSettingsStore()

    static func enable() {
        let allowed = Shared.allowed
        store.shield.applicationCategories = .all(except: allowed.applicationTokens)
        store.shield.webDomainCategories = .all(except: allowed.webDomainTokens)
    }

    static func disable() { store.clearAllSettings() }
}
