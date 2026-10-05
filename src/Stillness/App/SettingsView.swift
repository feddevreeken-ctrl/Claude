import SwiftUI
import FamilyControls

struct SettingsView: View {
    @State private var selection = Shared.allowed
    @State private var picking = false
    @State private var blocking = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Allowed apps (everything else is blocked)") {
                    Button("Choose allowed apps") { picking = true }
                    Text("\(selection.applicationTokens.count) apps, \(selection.categoryTokens.count) categories")
                        .foregroundStyle(.secondary)
                }
                Section("Manual test") {
                    Toggle("Block everything else now", isOn: $blocking)
                        .onChange(of: blocking) { _, on in on ? Blocker.enable() : Blocker.disable() }
                }
                Section {
                    Text("To block automatically: Settings → Focus → (your Focus) → Focus Filters → Add Filter → Stillness.")
                        .font(.footnote).foregroundStyle(.secondary)
                }
            }
            .familyActivityPicker(isPresented: $picking, selection: $selection)
            .onChange(of: selection) { _, new in Shared.allowed = new }
            .navigationTitle("Stillness")
        }
    }
}
