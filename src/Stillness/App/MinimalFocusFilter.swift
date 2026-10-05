import AppIntents

/// Appears under Settings → Focus → Focus Filters. iOS runs perform()
/// when the Focus turns on (and again with isEnabled=false when it ends).
struct MinimalFocusFilter: SetFocusFilterIntent {
    static var title: LocalizedStringResource = "Minimal Mode"
    static var description: LocalizedStringResource? = "Blocks every app except your allowed ones."

    @Parameter(title: "Block other apps", default: true)
    var blockOthers: Bool

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "Minimal Mode", subtitle: blockOthers ? "Blocking others" : "Not blocking")
    }

    func perform() async throws -> some IntentResult {
        blockOthers ? Blocker.enable() : Blocker.disable()
        return .result()
    }
}
