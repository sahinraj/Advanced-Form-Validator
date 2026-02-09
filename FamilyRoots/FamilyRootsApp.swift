import SwiftUI
import SwiftData

@main
struct FamilyRootsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
        .modelContainer(for: [PersistedFamilyMember.self], inMemory: true)
    }
}
