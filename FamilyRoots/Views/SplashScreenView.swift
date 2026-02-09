import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var animateLogo = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gradientTop, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            if isActive {
                HomeScreenView()
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "tree.fill")
                        .font(.system(size: 72))
                        .foregroundStyle(.white)

                    Text("FamilyRoots")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                }
                .scaleEffect(animateLogo ? 1.0 : 0.7)
                .opacity(animateLogo ? 1.0 : 0.4)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.9)) {
                        animateLogo = true
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
