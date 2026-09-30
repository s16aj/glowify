# Glowify

Glowify is a personal Flutter learning project built to practice mobile
application development, authentication, API integration, state management,
localization, and theming. It presents beauty-related imagery retrieved from
Pexels as demo content.

## Features

- Onboarding and splash flow
- Email/password authentication with Firebase Authentication
- Google Sign-In integration
- Beauty-related image content fetched from the Pexels API
- Responsive image and card browsing interface
- Detail views for images
- Favorites managed with Provider state management
- Light and dark theme switching
- English and Arabic localization
- Logout functionality

Favorites and theme preferences are currently session-based and are not
persisted between app launches.

## Tech Stack

- Flutter and Dart
- Firebase Core and Firebase Authentication
- Google Sign-In
- Provider
- Pexels API and HTTP
- easy_localization
- Google Fonts
- flutter_animate
- introduction_screen
- flutter_svg

## Getting Started

1. Clone the repository and enter the project directory:

	```bash
	git clone https://github.com/s16aj/glowify.git
	cd glowify
	```

2. Install the Flutter dependencies:

	```bash
	flutter pub get
	```

3. Obtain an API key from [Pexels](https://www.pexels.com/api/).

4. Run the app, supplying the key at build time:

	```bash
	flutter run --dart-define=PEXELS_API_KEY=YOUR_PEXELS_API_KEY
	```

The app reads `PEXELS_API_KEY` with Dart's `String.fromEnvironment`. Supply the
key through `--dart-define`; do not commit an API key to the repository.

## Firebase Configuration

Glowify uses Firebase Authentication for email/password and Google Sign-In.
The repository includes Firebase/FlutterFire configuration for an existing
project. Developers using their own Firebase project should configure Firebase
and FlutterFire for their platforms, update the project configuration, and
enable the required email/password and Google authentication providers.
Google Sign-In also requires appropriate OAuth credentials and platform
configuration.

## Testing

Run static analysis and the test suite with:

```bash
flutter analyze
flutter test
```

The current project passes both checks.

## Project Limitations

Glowify is a personal learning project. Pexels imagery is demo content, not a
real product catalog. Favorites are stored in memory, theme preference is not
persisted, and localization coverage is still in progress. The app does not
include a cart, checkout, payment flow, or commerce backend.

## What I Practiced

- Flutter UI development
- Navigation and application flows
- REST API consumption
- Firebase authentication
- State management with Provider
- Localization
- Theming
- Basic Flutter testing

## License and API Attribution

This repository does not currently specify a project license. Demo imagery and
content are retrieved through the [Pexels API](https://www.pexels.com/api/).
