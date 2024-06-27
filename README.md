# MyApp

This project is a Flutter application with Firebase authentication and theme management using GetX. The application allows users to register, log in, reset passwords, and toggle between light and dark themes.
## Project Structure
ib/
├── controllers/
│ ├── auth_controller.dart # Authentication controller
│ └── theme_notifier.dart # Theme management controller
├── services/
│ └── auth_service.dart # Firebase authentication service
├── themes/
│ ├── custom_color_scheme.dart # Custom color schemes
│ ├── custom_dark_theme.dart # Custom dark theme
│ ├── custom_light_theme.dart # Custom light theme
│ └── custom_theme.dart # Custom theme abstract class
├── ui/
│ ├── auth/
│ │ ├── login_page.dart # Login page
│ │ ├── recover_password_page.dart # Password recovery page
│ │ └── register_page.dart # Registration page
│ ├── home/
│ │ ├── custom_drawer.dart # Custom drawer for the home screen
│ │ └── home_screen.dart # Home screen
│ ├── widgets/
│ │ ├── confirmation_dialog.dart # Custom confirmation dialog
│ │ ├── custom_button.dart # Custom button widget
│ │ ├── custom_form_field.dart # Custom form field widget
│ │ ├── custom_icon_button.dart # Custom icon button widget
│ │ └── dialog_card.dart # Custom dialog card widget
├── utils/
│ ├── dialogs.dart # Utility for showing dialogs
│ └── validators.dart # Form validators
└── main.dart # Main entry point of the application 

## Table of Contents
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Firebase Setup](#firebase-setup)
- [Features](#features)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. **Clone the repository:**

    git clone https://github.com/Babek53/firebase_login.git
    cd myapp

2. **Install dependencies:**

    flutter pub get

3. **Setup Firebase:**
    - Follow the [Firebase setup instructions](#firebase-setup) below.

4. **Run the application:**

    flutter run

## Firebase Setup

1. **Create a Firebase project:**
    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Click "Add project" and follow the instructions.

2. **Add Android app to Firebase:**
    - Register your app with the package name `com.yourcompany.myapp`.
    - Download the `google-services.json` file and place it in the `android/app` directory.

3. **Add iOS app to Firebase:**
    - Register your app with the bundle ID `com.yourcompany.myapp`.
    - Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory.
    - Add the following configuration to your `ios/Runner/Info.plist` file:
xml
        <!-- Google Sign-In -->
        <key>CFBundleURLTypes</key>
        <array>
            <dict>
                <key>CFBundleTypeRole</key>
                <string>Editor</string>
                <key>CFBundleURLSchemes</key>
                <array>
                    <string>com.googleusercontent.apps.YOUR_FIREBASE_PROJECT</string>
                </array>
            </dict>
        </array>
        <key>GoogleSignInClientID</key>
        <string>YOUR_FIREBASE_PROJECT.apps.googleusercontent.com</string>


4. **Configure `android/app/build.gradle`:**gradle
    dependencies {
        implementation "org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version"
        implementation 'androidx.multidex:multidex:2.0.1'
        implementation platform("com.google.firebase:firebase-bom:33.1.1")
        implementation "com.google.firebase:firebase-analytics"
        implementation "com.google.firebase:firebase-auth"
        implementation "com.google.firebase:firebase-firestore"
    }
    plugins {
        id "com.google.gms.google-services"
    }

    signingConfigs {
        release {
            keyAlias 'my-key-alias'
            keyPassword '235689'
            storeFile file('YOUR_PROJECT/android/app/my-release-key.jks')
            storePassword 'yourpassword'
        }
    }




## Features

- **Authentication:**
  - Register and log in with email and password.
  - Sign in with Google.
  - Password reset functionality.

- **Theme Management:**
  - Toggle between light and dark themes.
  - Save theme preference using `SharedPreferences`.

- **UI Components:**
  - Custom buttons, form fields, and dialogs.

## Usage

### Authentication

- **Register:**
  - Enter your full name, email, and password, then click "Create Account".
  - A verification email will be sent to your email address.

- **Login:**
  - Enter your email and password, then click "Login".

- **Password Reset:**
  - Click "Forgot Password?", enter your email, and click "Send Recovery Link".

### Theme Management

- **Toggle Theme:**
  - Open the drawer and click on "Light Mode" or "Dark Mode" to switch themes.

## Contributing

Contributions are welcome! Please read the [contributing guidelines](CONTRIBUTING.md) first.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
# firebase_login
