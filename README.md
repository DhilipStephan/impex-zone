# Impex Zone Flutter App

Impex Zone is now structured as a **Flutter project** so the same experience can run on mobile devices (Android/iOS) and web from a single codebase.

## What changed

- Replaced static-page usage with a Flutter app entrypoint at `lib/main.dart`
- Added a mobile-first UI shell with:
  - Bottom navigation on small screens
  - Navigation rail on wider screens
- Recreated key website sections as app screens:
  - Home
  - About
  - Services
  - Products
  - Contact

## Project structure

```text
impex-zone/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
├── analysis_options.yaml
└── assets/
    └── images/
```

## Run locally

1. Install Flutter SDK (stable channel).
2. Fetch packages:

```bash
flutter pub get
```

3. Run on a connected device/emulator:

```bash
flutter run
```

### Run on web

```bash
flutter run -d chrome
```

## Notes

- Existing HTML/CSS files are still present in the repo for content reference/migration.
- App content currently mirrors the important business sections from the original site in a mobile-friendly layout.
