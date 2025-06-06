# StringCalculator-iOS App

This app is an iOS Developer assignment. It uses **Swift**, **TDD**, **UIKit**, and **MVVM** architecture.

## Features

- Add comma or newline-separated numbers
- Support custom delimiters (e.g., `//;\n1;2`)
- Shows error message on negative inputs
- Clean and simple iOS UI
- Input via keyboard and handles keyboard dismissal properly
- Fully functional **Home screen UI**
- Implemented a basic **Splash screen** on app launch

## Project Structure

- `Model/` → Business logic (`StringCalculator`)
- `ViewModel/` → ViewModel layer (`StringCalculatorViewModel`)
- `View/` → Storyboard + ViewController (`Home Screen`)
- `Tests/` → Unit tests with XCTest (`StringCalculatorTests`)

## UI & UX

- Built a **Home Screen** with:
  - Input field for entering number strings
  - Calculate button to trigger operation
  - Result label for displaying output
- **Splash Screen** shows on launch before transitioning to the home screen
- Keyboard behavior:
  - Opens on focus
  - Dismisses on "Done" or outside tap
  - Input validation via ViewModel

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/vijaybatho/StringCalculator-iOS.git
   cd StringCalculator-iOS
