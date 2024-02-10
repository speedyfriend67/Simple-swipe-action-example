# SwiftUI User Management App

This is a simple SwiftUI app for managing a list of users. It allows users to add new users, delete existing users, clone users, and adjust settings such as font size.

## Features

- Add new users: Enter a username in the text field and tap "Add User" to create a new user.
- Delete users: Swipe left on a user's name in the list and tap "Delete" to remove the user.
- Clone users: Swipe right on a user's name in the list and tap "Clone" to create a duplicate user.
- Adjust font size: Tap the gear icon in the navigation bar to access the settings view, where you can adjust the font size using a slider.

## Function Explanations

### `UsersViewModel`

- `addUser(name: String)`: Adds a new user with the given name to the `users` array.
- `deleteUser(at indexSet: IndexSet)`: Deletes the user at the specified indices from the `users` array.
- `cloneUser(at index: Int)`: Creates a duplicate user based on the user at the specified index and adds it to the `users` array.

### `SettingsView`

- `@State private var fontSize: CGFloat`: Stores the font size value for adjusting the font size in the view.

### `ContentView`

- `@StateObject var viewModel = UsersViewModel()`: Initializes the view model for managing users.
- `@State private var newUserName = ""`: Stores the input value for adding a new user.
- `@State private var isSettingsPresented = false`: Tracks the presentation state of the settings view.

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)
*Add new users and manage existing users.*

![Screenshot 2](screenshots/screenshot2.png)
*Adjust font size in the settings view.*

## Usage

1. Clone or download the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.

## Requirements

- Xcode 12 or later
- Swift 5.3 or later
- iOS 14.0 or later

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
