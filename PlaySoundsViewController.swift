//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Hayley Cundiff on 11/13/15.
//  Copyright (c) 2015 Artifylabs. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        var filePathUrl = NSURL.fileURLWithPath(filePath!)
        audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func slowSpeaking(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
        
    
    
    }
    @IBAction func StopAudio(sender: UIButton) {
        audioPlayer.stop()
    
    }

    @IBAction func fastSpead(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.play()
    
    
    
    }
    @IBAction func onSlowSpeak(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
        
    
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
