# 📸 Flutter Photo Gallery App

A modern, responsive photo gallery application built with Flutter, showcasing clean architecture, state management with BLoC/Cubit, and comprehensive testing.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

- 🖼️ **Photo Gallery**: Browse beautiful photos with grid and list views
- 🔍 **Search Functionality**: Find photos by title with real-time search
- 🏷️ **Category Filtering**: Filter photos by album categories
- 📱 **Responsive Design**: Optimized for all screen sizes using ScreenUtil
- 🎨 **Modern UI**: Material 3 design with smooth animations
- 🔄 **Pull to Refresh**: Refresh photos with intuitive swipe gesture
- ⚡ **Fast Loading**: Efficient image loading with placeholder support
- 🧪 **Comprehensive Testing**: 15 unit and widget tests with 100% coverage

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                          # Core utilities and configurations
│   ├── di/                        # Dependency injection setup
│   ├── error_handler/             # Global error handling
│   ├── networking/                # API client configuration
│   ├── router/                    # App navigation and routing
│   └── style/                     # App theming and styling
├── features/
│   ├── home/                      # Photo gallery feature
│   │   ├── data/                  # Data layer (API, repositories)
│   │   ├── domain/                # Domain layer (entities, use cases)
│   │   └── presentation/          # UI layer (screens, widgets, state)
│   └── splash/                    # Splash screen feature
└── main.dart                      # App entry point
```

### 📱 Presentation Layer

- **BLoC/Cubit**: State management with `flutter_bloc`
- **Modular Widgets**: Separated components for better maintainability
- **Responsive UI**: `flutter_screenutil` for adaptive layouts

### 🏢 Domain Layer

- **Use Cases**: Business logic encapsulation
- **Entities**: Core data models
- **Repository Interfaces**: Abstraction for data sources

### 🗃️ Data Layer

- **API Integration**: RESTful API with `Retrofit` and `Dio`
- **Repository Implementation**: Concrete data source implementations
- **JSON Serialization**: Automated with `json_serializable`

## 🛠️ Tech Stack

### Core Framework

- **Flutter**: Latest stable version
- **Dart**: ^3.9.0

### State Management

- **flutter_bloc**: ^9.1.1 - BLoC pattern implementation
- **equatable**: ^2.0.7 - Value equality comparisons

### Networking

- **dio**: ^5.9.0 - HTTP client
- **retrofit**: ^4.7.2 - Type-safe API client
- **pretty_dio_logger**: ^1.4.0 - Network request logging

### UI & Design

- **flutter_screenutil**: ^5.9.3 - Responsive design
- **flutter_svg**: ^2.2.1 - SVG image support
- **carousel_slider**: ^5.1.1 - Image carousel
- **cupertino_icons**: ^1.0.8 - iOS-style icons

### Dependency Injection

- **get_it**: ^8.2.0 - Service locator pattern

### Code Generation

- **build_runner**: ^2.7.1 - Code generation runner
- **json_serializable**: ^6.11.0 - JSON serialization
- **retrofit_generator**: ^10.0.4 - API client generation

### Testing

- **flutter_test**: SDK - Widget and unit testing
- **mockito**: ^5.5.0 - Mock object generation
- **integration_test**: SDK - Integration testing

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.9.0)
- Dart SDK (^3.9.0)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/SayedMamdouh94/task_app.git
   cd task_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code files**

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/home/presentation/cubit/photo_cubit_test.dart
```

### Code Analysis

```bash
# Run static analysis
flutter analyze

# Format code
flutter format .
```

## 📸 Screenshots

| Home Screen                   | Search Feature                    | Category Filter                   |
| ----------------------------- | --------------------------------- | --------------------------------- |
| ![Home](screenshots/home.png) | ![Search](screenshots/search.png) | ![Filter](screenshots/filter.png) |

## 🧪 Testing

The project includes comprehensive testing coverage:

- **Unit Tests**: Business logic and use cases
- **Widget Tests**: UI components and interactions
- **Cubit Tests**: State management verification
- **Integration Tests**: End-to-end user flows

### Test Structure

```
test/
├── features/
│   └── home/
│       ├── data/                  # Repository tests
│       ├── domain/                # Use case tests
│       └── presentation/          # Widget and cubit tests
└── widget_test.dart              # Main app tests
```

## 🏛️ Project Structure

```
task_app/
├── android/                      # Android-specific files
├── ios/                          # iOS-specific files
├── lib/                          # Main source code
├── test/                         # Test files
├── web/                          # Web-specific files
├── analysis_options.yaml         # Linting rules
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## 🔧 Configuration

### API Endpoint

The app fetches photos from [JSONPlaceholder](https://jsonplaceholder.typicode.com/photos)

### Image Service

Images are served from [placehold.co](https://placehold.co) in PNG format for optimal compatibility

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Sayed Mamdouh**

- GitHub: [@SayedMamdouh94](https://github.com/SayedMamdouh94)

## 🙏 Acknowledgments

- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) for the free API
- [Flutter Team](https://flutter.dev/) for the amazing framework
- [BLoC Library](https://bloclibrary.dev/) for state management patterns

---

⭐ If you found this project helpful, please give it a star!
