import SwiftUI
import FamilyControls

@main
struct StillnessApp: App {
    var body: some Scene {
        WindowGroup {
            RootView().preferredColorScheme(.dark)
        }
    }
}

struct RootView: View {
    @State private var showSettings = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            HomeView()
        }
        .overlay(alignment: .topTrailing) {
            Button { showSettings = true } label: {
                Image(systemName: "circle.grid.2x2").foregroundStyle(.gray.opacity(0.5)).padding(24)
            }
        }
        .sheet(isPresented: $showSettings) { SettingsView() }
        .task { try? await AuthorizationCenter.shared.requestAuthorization(for: .individual) }
    }
}
