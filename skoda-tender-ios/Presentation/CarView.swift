import SwiftData
import SwiftUI

struct CarView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 300)
            HStack {
                Text("Payment Services").font(.custom("SKODANext-Bold", size: 22)).foregroundStyle(.white)
                Spacer()
                Text("View All").font(.custom("SKODANext-Regular", size: 14)).foregroundStyle(.electric300)
            }
            ScrollView(.horizontal) {
                LazyHStack {
                    Text("First Row")
                        .font(.custom("SKODANext-Light", size: 16))
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.neutral900)
                        .cornerRadius(25)
                    Text("Second Row").font(.custom("SKODANext-Light", size: 16))
                        .foregroundStyle(.white)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.neutral900)
                        .cornerRadius(25)
                    Text("Third Row").font(.custom("SKODANext-Light", size: 16))
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.neutral900)
                        .cornerRadius(25)
                }
            }
            ScrollView(.horizontal) {
                LazyHStack {
                    Text("First Row")
                        .font(.custom("SKODANext-Bold", size: 22))
                        .foregroundStyle(.white)
                        .padding()
                        .background(.electric600)
                        .cornerRadius(25)
                    Text("Second Row").font(.custom("SKODANext-Bold", size: 22))
                        .foregroundStyle(.white)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.electric600)
                        .cornerRadius(25)
                    Text("Third Row").font(.custom("SKODANext-Bold", size: 22))
                        .foregroundStyle(.white)
                        .padding()
                        .background(.electric600)
                        .cornerRadius(25)
                }
            }
        }.padding(20)
    }
}

#Preview {
    ZStack {
        Color(.black)
        CarView()
    }
}
