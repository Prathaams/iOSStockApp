import SwiftUI
import Combine

class StockViewModel: ObservableObject {
    @Published var stock: Stock? = nil
    @Published var errorMessage: String? = nil
    @Published var loading: Bool = false

    private let apiKey = "YOUR_ALPHA_VANTAGE_API_KEY"

    func fetchStock(for symbol: String) {
        loading = true
        errorMessage = nil
        StockAPIService.fetchStockData(symbol: symbol, apiKey: apiKey) { result in
            DispatchQueue.main.async {
                self.loading = false
                switch result {
                case .success(let stock):
                    self.stock = stock
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
