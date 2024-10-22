import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    private let items: [MenuItem] = [
        MenuItem(text: "Car", icon: "car"),
        MenuItem(text: "Maps", icon: "map"),
        MenuItem(text: "Inspect", icon: "camera"),
        MenuItem(text: "Discover", icon: "doc"),
        MenuItem(text: "Profile", icon: "person"),
    ]

    var body: some View {
        TabView {
            ForEach(items, id: \.self) { item in
                VStack {
                    Spacer()
                    Text(item.text).font(.custom("SKODANext-Regular", size: 36)).foregroundStyle(.white)
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
        .modelContainer(for: Item.self, inMemory: true)
}
