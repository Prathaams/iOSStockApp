import SwiftUI

struct StockCardView: View {
    let stock: Stock

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.2))
                .blur(radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.green, lineWidth: 1)
                )
                .shadow(radius: 10)

            VStack(spacing: 10) {
                Text(stock.companyName)
                    .font(.title)
                    .foregroundColor(.white)
                Text("Price: \(stock.price)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Change: \(stock.changePercentage)")
                    .font(.subheadline)
                    .foregroundColor(stock.changePercentage.contains("-") ? .red : .green)
            }
            .padding()
        }
        .frame(height: 150)
        .padding([.leading, .trailing], 24)
    }
}
