# FlutterRickAndMortyCubitApp

This Flutter application uses the Rick and Morty API to display characters and their details. It also fetches quotes for each character. The app employs Cubit for state management and includes a search functionality to filter characters by name.

## Features

- **Character List Screen**: Displays all characters in a grid list.
  - Includes a search bar to filter characters by name.
- **Character Detail Screen**: Shows detailed information about the selected character.
  - Displays character's image, status, origin, location, species, gender, sub-species, and a quote.

## Screenshots
<HTML>
    <body>
        <img src="https://github.com/MoazSayed7/FlutterRickAndMortyCubitApp/assets/75115429/19d91865-2a51-456c-8b75-b26920ef7b33" alt="drawing" style="width:250px;"/>
        <img src="https://github.com/MoazSayed7/FlutterRickAndMortyCubitApp/assets/75115429/cbfb7b53-d479-4002-a5b8-7c796af416c2" alt="drawing" style="width:250px;"/>
        <img src="https://github.com/MoazSayed7/FlutterRickAndMortyCubitApp/assets/75115429/4cb24733-2dba-4a6c-a647-92fe2f268718" alt="drawing" style="width:250px;"/>
        <br />
        <br />
        <br />
        <img src="https://github.com/MoazSayed7/FlutterRickAndMortyCubitApp/assets/75115429/6bce0d91-870d-4c6e-b89e-0922cab34e7d" alt="drawing" style="width:250px;"/>
        <img src="https://github.com/MoazSayed7/FlutterRickAndMortyCubitApp/assets/75115429/bec5e493-1d21-4484-b59e-c13876c8b8f3" alt="drawing" style="width:250px;"/>
    </body>
</HTML>

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- An API key from [Quotes API - API Ninjas](https://api-ninjas.com/api/quotes)

### Dependencies

This project uses the following Flutter packages:

- [animated_text_kit](https://pub.dev/packages/animated_text_kit)
- [dio](https://pub.dev/packages/dio)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_offline](https://pub.dev/packages/flutter_offline)
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/FlutterRickAndMortyCubitApp.git
    ```

2. Navigate to the project directory:
    ```sh
    cd FlutterRickAndMortyCubitApp
    ```

3. Install the dependencies:
    ```sh
    flutter pub get
    ```

4. Open the file `lib/data/web_services/characters_web_services.dart` and replace:
    ```dart
    final headers = {'X-Api-Key': 'YOUR_API_KEY'};
    ```
    with your API key from API Ninjas.

5. Run the app:
    ```sh
    flutter run
    ```

## Project Structure

Here is a brief explanation of the project's folder structure:

```
lib/
├── business_logic/
│   └── cubit/
│       ├── characters_cubit.dart
│       └── characters_state.dart
├── Constance/
│   ├── my_colors.dart
│   └── strings.dart
├── data/
│   ├── models/
│   │   ├── characters.dart
│   │   └── quotes.dart
│   ├── repositories/
│   │   └── characters_repo.dart
│   └── web_services/
│       └── characters_web_services.dart
├── presentation/
│   ├── screens/
│   │   ├── character_details_screen.dart
│   │   └── characters_screen.dart
│   └── widgets/
│       └── character_item.dart
├── app_router.dart
└── main.dart
```

## Usage

- **Character List Screen**: 
  - Displays all characters in a grid format.
  - Use the search bar to find characters by their name.

- **Character Detail Screen**:
  - Click on any character to view their details.
  - Details include the character's image, status, origin, location, species, gender, sub-species, and a quote.

## API Integration

### Rick and Morty API

This API provides the characters with data.

### Quotes API

This API provides quotes for each character. As mentioned in the installation instructions, you need to replace the API key in `lib/data/web_services/characters_web_services.dart`.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements.
