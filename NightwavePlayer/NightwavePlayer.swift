//
//  NightWavePlayer.swift
//  NightwavePlaza
//
//  Created by Lerk on 04/01/2019.
//  Copyright © 2019 Lerk. All rights reserved.
//

import Foundation
import AVKit

class NightwavePlayer {
    var audioUrl = "https://radio.plaza.one/mp3"
    var player: AVPlayer?
    var playing: Bool = false
    
    func startAudio() {
        guard let url = URL.init(string: audioUrl)
            else {
                return
        }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        player?.play()
        playing = true;
    }
    
    func stopAudio() {
        player?.pause()
        playing = false;
    }
}
