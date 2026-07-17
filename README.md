# Zaylo Flutter MVP

Zaylo is a clean, minimal Flutter frontend MVP for an everyday life platform initially focused on Zimbabwe. It demonstrates onboarding, mock authentication, bottom navigation, everyday service discovery, community discussions, AI assistance, and feature pages for expenses, prices, fuel, exchange rates, jobs, student resources, farming, rentals, outages, and bill reminders.

## Tech stack

- Flutter and Dart with null safety
- Riverpod for simple state management
- go_router for named routing and guarded onboarding/auth flows
- Mock repository and service layers ready to replace with Firebase, APIs, Firebase Authentication, Firebase Cloud Messaging, or AI APIs later

## Project structure

```text
lib/
  core/              # constants, theme, routing, shared widgets
  models/            # strongly typed MVP models
  repositories/      # mock data repositories and providers
  services/          # service abstractions such as AI
  features/          # feature-based screens
  main.dart
```

## Running locally

1. Install Flutter 3.22 or newer.
2. Fetch packages:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```
4. Run checks:
   ```bash
   dart format .
   flutter analyze
   flutter test
   ```

## MVP notes

- All visible data is fictional sample data and should not be treated as live financial, outage, or market information.
- Authentication is mocked and does not store passwords manually.
- Community information includes timestamps, verification status, and report/save actions.
- Push notifications and backend submissions are intentionally stubbed with clear feedback so Firebase services can be connected later.
