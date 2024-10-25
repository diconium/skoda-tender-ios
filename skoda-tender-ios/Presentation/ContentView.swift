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
                    CarView()
                    Divider()
                    Spacer()
                }
                .tabItem {
                    Label(item.text,
                          systemImage: item.icon)
                }
                .background(.neutral900)
            }
        }.preferredColorScheme(.dark)
            .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MenuItemModel.self, inMemory: true)
}
