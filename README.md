# Planets App 🌍

Welcome to the **Planets App**! This app provides an engaging way to learn about planets, astronomy, and space exploration. Featuring quizzes, animations, interactive elements, and data from two powerful space APIs, this app is built with Clean Architecture and includes multi-language localization and theming.

## Features ✨

- **Introduction Screen**: Get started with a beautiful introduction screen that explains the app's purpose and key features.

- **Planet Information**: Explore detailed explanations about each planet, including their characteristics, history, and more.

- **Quizzes**: Test your knowledge about space and planets through fun, interactive quizzes. Supports different question types like multiple-choice, true/false, and more!

- **Animations**: Enjoy smooth animations such as:
    - **Fade-in effects** for transitions.
    - **Swipe-to-close** gestures to navigate easily.

- **Theming**: Customize the app's look and feel with light and dark themes.

- **Localization**: Supports multiple languages, making the app accessible globally.

- **APIs**:
    - **APOD (Astronomy Picture of the Day)**: See the latest astronomy photo, updated daily through the NASA APOD API.
    - **People in Space API**: Find out how many people are currently in space and learn more about their missions.

## Architecture 🏗️

The app follows **Clean Architecture**, ensuring scalability, separation of concerns, and maintainability. It is divided into the following layers:

- **Presentation Layer**: Handles UI/UX with widgets and animations.
- **Domain Layer**: Contains business logic and core entities like planets, quizzes, and user progress.
- **Data Layer**: Manages API calls, caching, and data persistence (e.g., astro photos, quiz results).

## Technologies Used 🚀

- **Flutter**: For building the entire UI with responsive design.
- **Clean Architecture**: Separation of concerns for maintainable and scalable code.
- **Localization**: Multilingual support with `intl` package for internationalization.
- **APIs**:
    - [NASA APOD API](https://api.nasa.gov/) for fetching daily space images.
    - [https://corquaid.github.io/international-space-station-APIs/JSON/people-in-space.json) for current astronaut data.
- **State Management**: Using BLoC for efficient state handling.
- **Theming**: Light and dark themes for a better user experience.
- **Animations**:
- **Tests**: Unit tests using: bloc_test, mockito,mocktail

## How to Use 📱

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/planets-app.git
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```


3. **Run the app:**:
   ```bash
   flutter run
   ```


## Future Enhancements 🔮

- **More Tests**: Additional unit and integration tests to improve code reliability and coverage.

- **Better Gallery**: Plan to integrate a more dynamic and visually appealing gallery section using the [Pinterest API](https://developers.pinterest.com/).

- **In Progress**: Please note that this app is still under development and not yet finished.

- **Detailed Planet Pages**: Enhance the app with more comprehensive and visually appealing pages for each planet, providing in-depth information and interactive elements.

- **More Quiz Questions**: Plan to add a larger variety of quiz questions and automate the question generation process for continuous updates.

