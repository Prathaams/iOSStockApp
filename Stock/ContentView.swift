import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = StockViewModel()
    @State private var symbol: String = ""

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    TextField("Enter Stock Symbol (e.g., AAPL)", text: $symbol)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Button(action: {
                        viewModel.fetchStock(for: symbol)
                    }) {
                        Text("Search")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()

                if viewModel.loading {
                    ProgressView("Fetching stock data...")
                        .foregroundColor(.white)
                        .padding()
                } else if let stock = viewModel.stock {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Company: \(stock.companyName)")
                            .font(.title)
                            .foregroundColor(.green)
                        
                        Text("Price: \(stock.price)")
                            .font(.title2)
                            .foregroundColor(.white)

                        Text("Open: \(stock.open)")
                            .foregroundColor(.white)

                        Text("High: \(stock.high)")
                            .foregroundColor(.white)

                        Text("Low: \(stock.low)")
                            .foregroundColor(.white)

                        Text("Volume: \(stock.volume)")
                            .foregroundColor(.white)

                        // Add more details as necessary
                    }
                    .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Spacer()
            }
            .padding()
        }
    }
}
