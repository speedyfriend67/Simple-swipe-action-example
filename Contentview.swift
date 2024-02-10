import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
}

class UsersViewModel: ObservableObject {
    @Published var users = [User]()
    
    func addUser(name: String) {
        let user = User(name: name)
        users.append(user)
    }
    
    func deleteUser(at indexSet: IndexSet) {
        users.remove(atOffsets: indexSet)
    }
    
    func cloneUser(at index: Int) {
        let userToClone = users[index]
        let clonedUser = User(name: userToClone.name)
        users.append(clonedUser)
    }
}

struct SettingsView: View {
    @State private var fontSize: CGFloat = 20.0
    
    var body: some View {
        VStack {
            Text("made by speedyfriend67")
                .font(.system(size: fontSize))
                .padding()
            
            Slider(value: $fontSize, in: 10...40, step: 1)
                .padding()
        }
        .navigationTitle("Settings")
    }
}

struct ContentView: View {
    @StateObject var viewModel = UsersViewModel()
    @State private var newUserName = ""
    @State private var isSettingsPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter username", text: $newUserName)
                    .padding()
                
                Button("Add User") {
                    viewModel.addUser(name: newUserName)
                    newUserName = ""
                }
                .padding()
                
                List {
                    ForEach(viewModel.users) { user in
                        Text(user.name)
                            .swipeActions(edge: .leading) {
                                Button("Delete") {
                                    if let index = viewModel.users.firstIndex(where: { $0.id == user.id }) {
                                        viewModel.deleteUser(at: IndexSet([index]))
                                    }
                                }
                                .tint(.red)
                            }
                            .swipeActions(edge: .trailing) {
                                Button("Clone") {
                                    if let index = viewModel.users.firstIndex(where: { $0.id == user.id }) {
                                        viewModel.cloneUser(at: index)
                                    }
                                }
                                .tint(.blue)
                            }
                    }
                }
            }
            .padding()
            .navigationTitle("Users")
            .navigationBarItems(trailing:
                Button(action: {
                    isSettingsPresented.toggle()
                }) {
                    Image(systemName: "gear")
                }
            )
            .sheet(isPresented: $isSettingsPresented) {
                NavigationView {
                    SettingsView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
