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
            apiCallTest()
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

    private func apiCallTest() -> some View {
        let statusDataSourceImpl = StatusDataSourceImpl()
        let carStatusRepositoryImpl = CarStatusRepositoryImpl(dataSource: statusDataSourceImpl)
        let useCase = GetCarInfoUseCase(repository: carStatusRepositoryImpl)

        useCase.execute { useCaseResult in

            switch useCaseResult {

            case .success(let useCaseData):
                var asd = useCaseData
                let asdew = "asdsad"


            case .failure(let useCaseError):
                let asdsad = "asdsad"
            }
        }

        return Text("Tab2")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MenuItem.self, inMemory: true)
}
