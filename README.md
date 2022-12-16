# My BMI Checker

An application that calculates the body mass index and makes some suggestions.

# Application Screenshots

![app_screenshots](https://user-images.githubusercontent.com/105479937/207308161-62731a7a-95ca-4cf5-9415-0b9885ea3f7c.png)

# Libraries:

Initialize the Flutter project, add all the necessary dependencies mentioned above in the **pubspec.yaml** configuration file and run `pub get`.

**pubspec.yaml**
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

  # Text
  auto_size_text: ^3.0.0
  google_fonts: ^3.0.1

  # Responsive
  sizer: ^2.0.15

  # Design
  kartal: ^2.7.0
  lottie: ^2.0.0

  # Image
  flutter_svg: ^1.1.6

  # Navigation
  go_router: ^5.2.2

  # Localization
  bot_toast: ^4.0.3

  # Network
  connectivity_plus: ^3.0.2

  # Firebase
  firebase_core: ^2.3.0
  firebase_storage: ^11.0.7
  cloud_firestore: ^4.1.0

  # State Management
  provider: ^6.0.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

   # Application Icon
  flutter_launcher_icons: ^0.11.0
  ```

## Getting Started

First of all, there are two main builds in our lib folder. These are view and core structures.

- core: This layer is the part that will manage or initiate the work that will do our main work.

base: This layer contains our main functions and service files.

components: This layer contains widgets that we can use on the pages, such as button, text, scaffold, which we can create here and customize with parameters where we want to use them.

constants: This layer consists of two structures, these structures are app and enums structures.

extensions: This layer and the project contain the basic structure, String and int.

init: This layer consists of 4 main structures. These structures are main_build , routes , network and theme.

- view: This layer contains our screens. We can create a folder for each screen and keep a viewModel or model file for this screen, if necessary, in this folder.

Note: The app asks you to select a gender on the homepage but nothing happens for that selection afterwards. If this had been done, it was coded as how it could have been done.
