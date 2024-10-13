# Stock Lookup App

The **Stock Lookup App** is an iOS application built using **SwiftUI** and **Alpha Vantage API** integration. It allows users to search for stock symbols and view real-time stock data, including the current price, percentage change, and other financial details.

## Features

- **Search Stocks**: Users can search for stock symbols (e.g., AAPL, TSLA) and get real-time data.
- **Glass UI**: The app features a modern glass-style user interface with a matte black background and metallic green accents.
- **Dynamic Search Bar**: The search bar is large, easy to use, and reloading occurs every 5 minutes to update stock data.
- **Stock Information**: Displays company name, current stock price, percentage change, open price, high/low prices, and volume.
- **Z-axis Card View**: Search results are displayed in a card-like structure with a 3D z-axis effect.

## Screenshots

<img width="559" alt="Screenshot 2024-10-13 at 22 51 56" src="https://github.com/user-attachments/assets/8ed4b207-534b-4c58-8ef5-42dfe0742104">

<img width="559" alt="Screenshot 2024-10-13 at 22 52 42" src="https://github.com/user-attachments/assets/99604193-c451-4fb6-b003-7c923a996c48">



## API Integration

This app uses the **Alpha Vantage API** to fetch real-time stock data. You can sign up for a free API key on the [Alpha Vantage website](https://www.alphavantage.co/).

### Example API URL

https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=SYMBOL&interval=1min&apikey=YOUR_API_KEY


## Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/stock-lookup-app.git
   cd stock-lookup-app

2. Open StockLookupApp.xcodeproj

3. Let apiKey = "YOUR_API_KEY"

4. Build and run the app in Xcode.


##Usage

Enter a stock symbol (e.g., AAPL for Apple, TSLA for Tesla) in the search bar and press the search button.
View the stock’s current price, percentage change, open, high, low, and volume information.
The data will automatically refresh every 5 minutes.

##Project Structure

ContentView.swift: The main view with the search bar and stock cards.
Stock.swift: Model for representing stock data.
StockViewModel.swift: Handles the business logic for fetching stock data from the API and parsing it.
StockAPIService.swift: Service responsible for making API requests to Alpha Vantage and handling the response.
GlassUIExtensions.swift: Custom UI components and extensions for creating the glass-effect UI.

##Requirements

iOS 14.0+
Xcode 12.0+
Swift 5.0+
Alpha Vantage API Key

##Architecture

This project follows the MVVM (Model-View-ViewModel) architecture to keep the code modular, clean, and maintainable.

Model: The Stock model represents the stock data fetched from the API.
ViewModel: The StockViewModel handles all business logic, including API calls and data processing.
View: The ContentView is responsible for rendering the UI components.

##Future Improvements

Add support for historical data and charting.
Improve error handling for invalid stock symbols and network failures.
Add unit tests for ViewModel and API service.

##Acknowledgments

Stock data provided by Alpha Vantage.


### Key Sections:

1. **Project Overview**: Describes what the app does.
2. **Features**: Highlights the app's features like search functionality, real-time updates, and UI elements.
3. **Installation**: Provides instructions on how to set up the project on a local machine.
4. **Usage**: Basic usage guide for searching stocks.
5. **Project Structure**: Lists the key files and their responsibilities.
6. **Requirements**: Specifies the minimum iOS version and tools required.
7. **Architecture**: Describes the MVVM architecture used in the app.
8. **Future Improvements**: Ideas for extending functionality.
9. **Acknowledgments**: Credits for the API source.
