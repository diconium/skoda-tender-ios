import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            Text("Car")
                .tabItem {
                    Label("Car",
                          systemImage: "car")
                }
            Text("Maps")
                .tabItem {
                    Label("Maps",
                          systemImage: "map")
                }
            Text("Inspect")
                .tabItem {
                    Label("Inspect",
                          systemImage: "camera")
                }
            Text("Discover")
                .tabItem {
                    Label("Discover",
                          systemImage: "doc")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile",
                          systemImage: "person")
                }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
