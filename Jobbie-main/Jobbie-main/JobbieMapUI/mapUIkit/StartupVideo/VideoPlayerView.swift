import SwiftUI
import AVKit
import AVFoundation


struct VideoPlayerView: View {
    private let player = AVPlayer(url: Bundle.main.url(forResource: "jobbievideo", withExtension: "mov")!)

    var body: some View {
        VideoPlayerController(player: player)
            .edgesIgnoringSafeArea(.all) // Ensures video covers the entire screen
            .onAppear {
                player.play()
            }
    }
}


