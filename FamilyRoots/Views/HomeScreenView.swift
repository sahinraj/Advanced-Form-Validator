import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.gradientTop, .gradientBottom],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer()

                    VStack(spacing: 12) {
                        Image(systemName: "tree")
                            .font(.system(size: 68, weight: .bold))
                            .foregroundStyle(.white)

                        Text("FamilyRoots")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                            .foregroundStyle(.white)
                    }

                    Spacer()

                    VStack(spacing: 14) {
                        NavigationLink(destination: FamilyTreeView(root: .sampleTree)) {
                            Text("Sign Up")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(HomeButtonStyle(background: .primaryGreen))

                        NavigationLink(destination: FamilyTreeView(root: .sampleTree)) {
                            Text("Log In")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(HomeButtonStyle(background: .accentBrown))
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

private struct HomeButtonStyle: ButtonStyle {
    let background: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.vertical, 14)
            .background(background.opacity(configuration.isPressed ? 0.7 : 1.0))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    HomeScreenView()
}
