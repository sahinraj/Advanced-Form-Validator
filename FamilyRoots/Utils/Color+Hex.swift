import SwiftUI

extension Color {
    static let primaryGreen = Color(hex: "#4CAF50")
    static let accentBrown = Color(hex: "#795548")
    static let gradientTop = Color(hex: "#355E3B")
    static let gradientBottom = Color(hex: "#D9D2C5")

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex.replacingOccurrences(of: "#", with: ""))
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
