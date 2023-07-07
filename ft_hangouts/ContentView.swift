import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach((0...10), id: \.self) { item in
                    VStack(alignment: .leading, spacing: 8) {
                        Text ("Name").font(.system(size: 26, design: .rounded).bold())
                        Text ("Email").font(.callout.bold())
                        Text ("Number").font(.callout.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(alignment: .topTrailing) {
                        Button {
                            // TODO : button
                        } label: {
                            Image(systemName: "star")
                                .font(.title3)
                                .symbolVariant(.fill)
                                .foregroundColor(.gray.opacity(0.3))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
