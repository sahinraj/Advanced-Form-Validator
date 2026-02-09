import SwiftUI

struct FamilyTreeView: View {
    let root: FamilyMember
    @State private var expandedNodeIDs: Set<UUID> = []

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            VStack {
                treeNode(root)
            }
            .padding(24)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Family Tree")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            expandedNodeIDs.insert(root.id)
        }
    }

    @ViewBuilder
    private func treeNode(_ member: FamilyMember) -> some View {
        let isExpanded = expandedNodeIDs.contains(member.id)

        VStack(spacing: 10) {
            FamilyNodeView(member: member)
                .onTapGesture {
                    toggleExpansion(for: member)
                }

            if !member.children.isEmpty {
                Image(systemName: isExpanded ? "chevron.down.circle.fill" : "chevron.right.circle.fill")
                    .foregroundStyle(.accentBrown)
                    .onTapGesture {
                        toggleExpansion(for: member)
                    }
            }

            if isExpanded, !member.children.isEmpty {
                ConnectionLineView()

                HStack(alignment: .top, spacing: 28) {
                    ForEach(member.children) { child in
                        VStack(spacing: 10) {
                            ConnectorLine(
                                from: CGPoint(x: 32, y: 0),
                                to: CGPoint(x: 32, y: 16)
                            )
                            .stroke(.secondary, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                            .frame(width: 64, height: 16)

                            treeNode(child)
                        }
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: isExpanded)
    }

    private func toggleExpansion(for member: FamilyMember) {
        if expandedNodeIDs.contains(member.id) {
            expandedNodeIDs.remove(member.id)
        } else {
            expandedNodeIDs.insert(member.id)
        }
    }
}

#Preview {
    NavigationStack {
        FamilyTreeView(root: .sampleTree)
    }
}
