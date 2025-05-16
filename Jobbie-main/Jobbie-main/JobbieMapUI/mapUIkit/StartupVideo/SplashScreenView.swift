import SwiftUI
import AVKit
import AVFoundation

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                MainTabView()
            } else {
                VideoPlayerView()
                    .onAppear {
                        // Automatically move to the next screen when the video finishes
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Replace 5 with your video duration
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
    }
}


