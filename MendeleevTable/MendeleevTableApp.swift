import SwiftUI

@main
struct MendeleevTableApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TabView {
                MainListView()
                    .tabItem {
                        Label("Элементы", systemImage: "list.bullet.rectangle")
                    }
                RastvorimostView()
                    .tabItem {
                        Label("Растворимость", systemImage: "aqi.medium")
                    }
            }
        }
    }
}
