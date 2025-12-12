# Count It - Counter Tracking App 📱

A simple and beautiful Flutter app to track anything you want to count. Perfect for workouts, habits, expenses, or daily tasks.

## ✨ Features

- **➕ Add Unlimited Counters**: Create custom counters with names and colors
- **🎨 Color Customization**: Choose from 6 beautiful colors
- **💾 Local Storage**: Data saved automatically on your device
- **🔄 Easy Operations**: Increment, decrement, and reset with one tap
- **📱 Clean UI**: Modern design with smooth animations

## 🏗️ Project Structure
lib/
├── main.dart # App entry point
└── src/
├── models/
│ └── counter_model.dart # Data model
├── controllers/
│ └── counter_controller.dart # Business logic
├── services/
│ └── shared_preferences_service.dart # Local storage
├── widgets/
│ ├── counter_card.dart # Counter display widget
│ └── color_selector.dart # Color picker widget
└── screens/
├── splash_screen.dart # Welcome screen
└── home_screen.dart # Main screen

text

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)

### Installation
1. Clone the repository
   ```bash
   https://github.com/salsabeel281/count-it-flutter.git
   cd counter_app_web
Install dependencies

bash
flutter pub get
Run the app

bash
flutter run
🛠️ Tech Stack
Framework: Flutter

Language: Dart

State Management: ChangeNotifier

Local Storage: SharedPreferences

Architecture: Clean separation (Models, Controllers, Services, UI)

📱 How to Use
Add Counter: Tap the + button, enter name, choose color

Increment/Decrement: Tap + or - buttons on each counter

Reset/Delete: Long press any counter for options

Data Persistence: All data saves automatically

👤 Author
Salsabeel - Flutter Developer
