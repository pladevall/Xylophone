//
//  ViewController.swift
//  Xylophone
//
//  Created by Xavier  on 04/08/2018.
//  Copyright © Xavier Pladevall. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var selectedSoundFile : String = ""
    let soundArray = ["note1", "note2", "note3","note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFile = soundArray[Int(sender.tag) - 1]
        playSound()
    }

    func playSound(){
        let soundURL = Bundle.main.url(forResource: selectedSoundFile, withExtension: "wav")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
}

