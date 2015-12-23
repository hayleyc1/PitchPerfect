//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Hayley Cundiff on 11/13/15.
//  Copyright (c) 2015 Artifylabs. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var RecordinginProgress: UILabel!
    var audioRecorder:AVAudioRecorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    

     func stopAudio(sender: UIButton) {
        RecordinginProgress.hidden = true
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }

     func recordAudio(sender: UIButton) {
        RecordinginProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
        
        //Declared Globally
        var audioRecorder:AVAudioRecorder!
        
        //Inside func recordAudio(sender: UIButton)
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
       
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath!, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    
    
    
    }
        func audioRecorderDidFinsihRecording(recorder: AVAudioRecorder!, successfully flag: Bool)
        {
        //TODO: Record the user's voice
        println("in recordAudio")
    }
    
    override func viewWillAppear(animated: Bool) {
        //make stop button disappear
        stopButton.hidden = true
        recordButton.enabled = true
    }
    };
