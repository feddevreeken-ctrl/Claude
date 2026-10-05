import SwiftUI

struct AllowedApp: Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

/// Edit this list to change what shows on your minimal home screen.
let allowedApps: [AllowedApp] = [
    .init(name: "Phone",    url: "tel://"),
    .init(name: "WhatsApp", url: "whatsapp://"),
    .init(name: "Mail",     url: "googlegmail://"),   // use "message://" for Apple Mail
    .init(name: "Weather",  url: "weather://"),
    .init(name: "Claude",   url: "claude://"),
    .init(name: "ChatGPT",  url: "chatgpt://"),
    .init(name: "Google",   url: "google://"),
]

struct HomeView: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            TimelineView(.periodic(from: .now, by: 1)) { ctx in
                VStack(alignment: .leading, spacing: 4) {
                    Text(ctx.date, format: .dateTime.hour().minute())
                        .font(.system(size: 64, weight: .thin))
                    Text(ctx.date, format: .dateTime.weekday(.wide).day().month(.wide))
                        .font(.system(size: 15)).foregroundStyle(.gray)
                }
            }
            Spacer().frame(height: 48)
            ForEach(allowedApps) { app in
                Button { if let u = URL(string: app.url) { openURL(u) } } label: {
                    Text(app.name).font(.system(size: 28, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading).padding(.vertical, 10)
                }.foregroundStyle(.white)
            }
            Spacer()
        }
        .padding(.horizontal, 32)
    }
}
