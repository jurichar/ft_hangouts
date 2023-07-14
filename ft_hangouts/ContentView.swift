import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNewContact = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach((0...10), id: \.self) { item in
                    
                    ZStack (alignment: .leading){
                        NavigationLink(destination: ContactDetailedView()) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ContactRowView()
                    }
                }
            }
            .toolbar {
                ToolbarItem( placement: .primaryAction) {
                    Button {
                        isShowingNewContact.toggle()
                    } label: {
                        Image(systemName: "plus").font(.title2)
                    }
                }
            }
            .sheet(isPresented: $isShowingNewContact) {
                NavigationStack {
                    CreateContactView()
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
