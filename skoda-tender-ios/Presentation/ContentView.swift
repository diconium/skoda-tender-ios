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
            firetrapTestingStuff()
            ForEach(items, id: \.self) { item in

                VStack {
                    Spacer()
                    CarView()
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

    private func firetrapTestingStuff() -> some View {
        HttpHelper.shared.makeRequest("https://dummyjson.com/c/2d21-37ec-4fb6-852e") { data in

            let datsasd = data.response.result
        }

        HttpHelper.shared.makeRequest("https://dummyjson.com/c/2d21-37ec-4fb6-852e") { <#AFDataResponse<Data?>#> in
            <#code#>
        }

        
        return Text("Tab2")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
