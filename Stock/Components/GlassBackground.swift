//
//  GlassBackground.swift
//  Stock
//
//  Created by Pratham Patel on 13/10/24.
//


import SwiftUI

struct GlassBackground: View {
    var body: some View {
        Color.white
            .opacity(0.3)
            .background(BlurView(style: .systemUltraThinMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
}

// Blur view for Glass UI effect
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
