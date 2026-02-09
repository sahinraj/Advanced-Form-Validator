import SwiftUI

struct ConnectorLine: Shape {
    var from: CGPoint
    var to: CGPoint

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: from)
        path.addLine(to: to)
        return path
    }
}

struct ConnectionLineView: View {
    var body: some View {
        ConnectorLine(from: CGPoint(x: 10, y: 0), to: CGPoint(x: 10, y: 20))
            .stroke(.secondary, style: StrokeStyle(lineWidth: 2, lineCap: .round))
            .frame(width: 20, height: 20)
    }
}

#Preview {
    ConnectionLineView()
}
