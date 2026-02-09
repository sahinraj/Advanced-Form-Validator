import SwiftUI

struct FamilyNodeView: View {
    let member: FamilyMember

    var body: some View {
        VStack(spacing: 6) {
            Circle()
                .fill(Color.primaryGreen)
                .frame(width: 60, height: 60)
                .overlay(
                    Text(member.initials)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                )

            Text(member.name)
                .font(.subheadline)
                .fontWeight(.bold)

            Text(member.relationship)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(12)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    FamilyNodeView(member: .sampleTree)
}
