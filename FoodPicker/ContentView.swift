import SwiftUI

struct ContentView: View {
    let food = ["漢堡", "沙拉", "披薩", "義大利麵", "雞腿便當", "刀削麵", "火鍋", "牛肉麵", "關東煮"]
    @State private var selectedFood: String?
    
    var body: some View {
        VStack(spacing: 50) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
            
            Text("今天吃什麼？")
                .font(.title)
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Button(role: .none) {
                selectedFood = food.shuffled().first {
                    $0 != selectedFood
                }
            } label: {
                Text(selectedFood == .none ? "告訴我！" : "換一個").frame(width:200, alignment: .center)
            }.padding(.bottom, -30)
            
            Button(role: .destructive) {
                selectedFood = .none
            } label: {
                Text("重置").frame(width:200, alignment: .center)
            }.buttonStyle(.bordered)
            
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .animation(.easeInOut, value: selectedFood)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}

#Preview {
    ContentView()
}
