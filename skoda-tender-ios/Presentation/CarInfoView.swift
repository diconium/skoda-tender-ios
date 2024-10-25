import SwiftUI

struct CarInfoView: View {
    enum ViewType {
        case vehicle, battery, temperature
    }

    var type: ViewType = .vehicle

    let cardHeight: CGFloat = 80
    let cornerRadius: CGFloat = 5

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            if type == ViewType.vehicle {
                VehicleTypeView()
            }
            if type == ViewType.battery {
                BatteryTypeView()
            }
            if type == ViewType.temperature {
                TemperatureTypeView()
            }
            Spacer()
        }
        .background(.neutral800)
        .frame(maxWidth: .infinity, maxHeight: cardHeight)
        .addBorder(.neutral800, width: 1, cornerRadius: cornerRadius)
    }
}

struct VehicleTypeView: View {
    var body: some View {
        Text("Vehicle Status").font(.custom("SKODANext-Light", size: 14))
            .foregroundStyle(.white).padding(.horizontal, 20)
        HStack {
            Image(.notificationBell)
                .foregroundColor(.neutral200)
                .padding(.horizontal, 10)
            Text("Unlocked").font(.custom("SKODANext-Bold", size: 20))
                .foregroundStyle(.white)
                .cornerRadius(25)
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct BatteryTypeView: View {
    var body: some View {
        Text("Battery Range")
            .font(.custom("SKODANext-Light", size: 14))
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
        HStack(spacing: 10) {
            Image(.batteryIcon)
                .foregroundColor(.neutral200)
                .padding(.horizontal, 10)
            Text("61%/276 km")
                .font(.custom("SKODANext-Bold", size: 20))
                .foregroundStyle(.white)
            Spacer()
            Image(.plugIcon)
                .foregroundColor(.neutral200)
            Text("Not plugged in").font(.custom("SKODANext-Light", size: 12))
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 20)
    }
}

struct TemperatureTypeView: View {
    @State private var doesClose = true

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Target Temperature")
                    .font(.custom("SKODANext-Light", size: 14))
                    .foregroundStyle(.white)
                HStack {
                    Image(systemName: "thermometer")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                    Text("21ºC")
                        .font(.custom("SKODANext-Bold", size: 20))
                        .foregroundStyle(.white)
                    Spacer()
                }
            }.padding(.horizontal, 20)
            Spacer()
            VStack {
                Toggle("", isOn: $doesClose)
                    .toggleStyle(.switch)
                    .tint(.electric300)
                    .fixedSize()
                    .scaleEffect(0.8)
                    .offset(x: -5)
                Text("Activated")
                    .font(.custom("SKODANext-Light", size: 12))
                    .foregroundStyle(.white)
            }.padding(.horizontal, 20)
        }
    }
}

#Preview {
    CarInfoView(type: CarInfoView.ViewType.vehicle)
    CarInfoView(type: CarInfoView.ViewType.battery)
    CarInfoView(type: CarInfoView.ViewType.temperature)
}
