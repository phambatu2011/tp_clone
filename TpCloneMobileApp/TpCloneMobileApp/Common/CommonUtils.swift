import UIKit
import AVKit
import AVFoundation

class CommonUtils {
    private init() {}
    
    static let shared = CommonUtils.init()
    
    private func playVideo(videoName: String, instanceViewController: ViewController) {
        guard let path = Bundle.main.path(forResource: videoName, ofType:"m4v") else {
            debugPrint("video m4v not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
//        present(playerController, animated: true) {
//            player.play()
//        }
    }
}
