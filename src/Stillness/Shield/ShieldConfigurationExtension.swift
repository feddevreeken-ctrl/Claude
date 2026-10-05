import ManagedSettings
import ManagedSettingsUI
import UIKit

/// The pure-black screen shown when you tap a blocked app.
class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    private func black() -> ShieldConfiguration {
        ShieldConfiguration(
            backgroundBlurStyle: nil,
            backgroundColor: .black,
            icon: nil,
            title: .init(text: "", color: .white),
            subtitle: .init(text: "Not now.", color: .gray),
            primaryButtonLabel: .init(text: "Close", color: .white),
            primaryButtonBackgroundColor: .darkGray
        )
    }
    override func configuration(shielding application: Application) -> ShieldConfiguration { black() }
    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration { black() }
    override func configuration(shielding webDomain: WebDomain) -> ShieldConfiguration { black() }
    override func configuration(shielding webDomain: WebDomain, in category: ActivityCategory) -> ShieldConfiguration { black() }
}
