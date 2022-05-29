# Free Games List

# Epic Free

Flutter to get the most recent and upcoming free available games from the Epic Games' store.

## Description

The structure of the project is the following:

- **Models:** 
  - `FreeGame`model & Encoding/Decoding logic.
  - `Genres`.
  - **BLoC:** 
    - **State:** Where `loading` and `loaded` state are defined.
    - **Event:** Where we define the `fetch` event.
    - **Bloc:** Both `MostRecentGames` & `FreeGamesBloc`.
- **Services:** It made the requests to the [FreeToGame API](https://free-epic-games.p.rapidapi.com/free).
- **Screens:** Where the `HomeScreen` is defined.
- **Reusable:** Reusable views like `CardView`, `CellView`, `SectionHeader`.
- **Views:** The sections inside the `HomeScreen`.

## It makes use of the following packages

- [BLoC](https://bloclibrary.dev/#/): Used to separate the business logic from the presentation layer.
- [Equatable](https://pub.dev/packages/equatable): To compare the events and states.
- [JsonSerializable](https://pub.dev/packages/json_serializable): To generate the encode & decode methods for a class.
- [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter): To use some icons from there.
- [Google Fonts](https://pub.dev/packages/google_fonts): All the text widgets in the app use the Roboto family font.

## Screenshots



