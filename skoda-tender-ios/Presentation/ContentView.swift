import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    private let items: [MenuItemModel] = [
        MenuItemModel(text: "Car", icon: "car"),
        MenuItemModel(text: "Maps", icon: "map"),
        MenuItemModel(text: "Inspect", icon: "camera"),
        MenuItemModel(text: "Discover", icon: "doc"),
        MenuItemModel(text: "Profile", icon: "person"),
    ]

    var body: some View {
        TabView {
            ForEach(items, id: \.self) { item in
                VStack {
                    Spacer()
                    if item.icon == "car" {
                        CarView()
                    }
                    if item.icon == "person" {
                        ProfileView()
                    }
                    Divider()
                    Spacer()
                }
                .background(Color.neutral900)
                .tabItem {
                    Label(item.text,
                          systemImage: item.icon)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MenuItemModel.self, inMemory: true)
}
