# SwiftUI User Management App

This is a simple SwiftUI app for managing a list of users. It allows users to add new users, delete existing users, clone users, and adjust settings such as font size.

## Features

- Add new users: Enter a username in the text field and tap "Add User" to create a new user.
- Delete users: Swipe left on a user's name in the list and tap "Delete" to remove the user.
- Clone users: Swipe right on a user's name in the list and tap "Clone" to create a duplicate user.
- Adjust font size: Tap the gear icon in the navigation bar to access the settings view, where you can adjust the font size using a slider.

## Function Explanations

### `UsersViewModel`

- `addUser(name: String)`: Adds a new user with the given name to the `users` array. This function creates a new `User` object with the provided name and appends it to the `users` array, which triggers the `@Published` property wrapper to notify any subscribed views of the change.

- `deleteUser(at indexSet: IndexSet)`: Deletes the user at the specified indices from the `users` array. This function removes the users at the specified indices from the `users` array using the `remove(atOffsets:)` method, which automatically updates the view due to the `@Published` property wrapper.

- `cloneUser(at index: Int)`: Creates a duplicate user based on the user at the specified index and adds it to the `users` array. This function retrieves the user at the specified index from the `users` array, creates a new `User` object with the same name, and appends it to the `users` array. This action effectively clones the user.

### `SettingsView`

- `@State private var fontSize: CGFloat`: Stores the font size value for adjusting the font size in the view. This state variable is used to track the current font size selected by the user in the settings view. It is initialized with a default value of 20.0.

### `ContentView`

- `@StateObject var viewModel = UsersViewModel()`: Initializes the view model for managing users. This property wrapper creates an instance of `UsersViewModel` as a state object, ensuring that changes to the view model trigger view updates. The view model is responsible for managing the list of users and handling user interactions.

- `@State private var newUserName = ""`: Stores the input value for adding a new user. This state variable holds the value entered by the user in the text field for adding a new user. It is updated whenever the user types in the text field.

- `@State private var isSettingsPresented = false`: Tracks the presentation state of the settings view. This state variable controls whether the settings view is currently presented or not. It is toggled by tapping the gear icon in the navigation bar, which triggers the presentation of the settings view as a modal sheet.

## Screenshots

![IMG_7675](https://github.com/speedyfriend67/Simple-swipe-action-example/assets/82425907/e89f7b35-a48e-4cac-87c5-8a886a0109af)
*Add new users and manage existing users.*

![IMG_7677](https://github.com/speedyfriend67/Simple-swipe-action-example/assets/82425907/509259b6-69d5-4fb4-9af2-121e392a4e81)
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
