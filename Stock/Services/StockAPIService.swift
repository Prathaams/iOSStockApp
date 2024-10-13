import Foundation

struct StockAPIService {
    static func fetchStockData(symbol: String, apiKey: String, completion: @escaping (Result<Stock, Error>) -> Void) {
        let urlString = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=1min&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                // Print the raw data to see the structure
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Raw JSON Response: \(json)") // Debugging
                }

                // Try to parse the stock data
                let stock = try parseStockData(data: data)
                completion(.success(stock))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    static func parseStockData(data: Data) throws -> Stock {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw APIError.parsingFailed
        }
        
        // Try to print out keys and check if they exist
        print("Parsed JSON Keys: \(json.keys)")

        guard let metaData = json["Meta Data"] as? [String: Any],
              let symbol = metaData["2. Symbol"] as? String,
              let timeSeries = json["Time Series (1min)"] as? [String: Any],
              let latestEntry = timeSeries.first?.value as? [String: Any],
              let open = latestEntry["1. open"] as? String,
              let high = latestEntry["2. high"] as? String,
              let low = latestEntry["3. low"] as? String,
              let volume = latestEntry["5. volume"] as? String else {
            throw APIError.parsingFailed
        }

        let companyName = symbol.uppercased()
        return Stock(symbol: symbol, price: open, changePercentage: "N/A", companyName: companyName, open: open, high: high, low: low, volume: volume)
    }

    enum APIError: Error {
        case invalidURL
        case noData
        case parsingFailed
    }
}


func parseStockData(data: Data) throws -> Stock {
    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
        throw APIError.parsingFailed
    }

    // Check for API limit error
    if let errorMessage = json["Error Message"] as? String {
        throw APIError.invalidAPIKey(message: errorMessage)
    }
    
    if let note = json["Note"] as? String {
        throw APIError.rateLimitExceeded(message: note)
    }
    
    // Continue parsing as before
    guard let metaData = json["Meta Data"] as? [String: Any],
          let symbol = metaData["2. Symbol"] as? String,
          let timeSeries = json["Time Series (1min)"] as? [String: Any],
          let latestEntry = timeSeries.first?.value as? [String: Any],
          let open = latestEntry["1. open"] as? String,
          let high = latestEntry["2. high"] as? String,
          let low = latestEntry["3. low"] as? String,
          let volume = latestEntry["5. volume"] as? String else {
        throw APIError.parsingFailed
    }

    let companyName = symbol.uppercased()
    return Stock(symbol: symbol, price: open, changePercentage: "N/A", companyName: companyName, open: open, high: high, low: low, volume: volume)
}

enum APIError: Error {
    case invalidURL
    case noData
    case parsingFailed
    case invalidAPIKey(message: String)
    case rateLimitExceeded(message: String)
}
