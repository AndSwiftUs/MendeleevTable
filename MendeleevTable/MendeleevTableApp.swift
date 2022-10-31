import SwiftUI

@main
struct MendeleevTableApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TabView {
                MainListView()
                RastvorimostView()
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}
