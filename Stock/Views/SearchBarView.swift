import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        TextField("Enter Stock Symbol (e.g. AAPL)", text: $searchText)
            .padding()
            .background(Color.black.opacity(0.2))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 1))
            .foregroundColor(.white)
            .padding([.leading, .trailing], 24)
    }
}
