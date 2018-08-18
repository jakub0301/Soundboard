//
//  ViewController.swift
//  Soundboard
//
//  Created by Jakub0301 on 18/08/2018.
//  Copyright © 2018 Jakub0301. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let soundFilenames = ["emp_learntoknow","obiwan_chosenone","swvader01","yoda_twisted"]
    var audioPlayers = [AVAudioPlayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for sound in soundFilenames {
            do{
                //Try to do
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "mp3")!)
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
                audioPlayers.append(audioPlayer)
            }
            catch{
                //Catch the error
                audioPlayers.append(AVAudioPlayer())
            }


            //let audioPlayer = AVAudioPlayer(contentsOf: url)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        //Get the audioPlayer that corresponds to the button thath they tapped
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
    }
    
    
}

