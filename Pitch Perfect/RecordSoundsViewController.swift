//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Hayley Cundiff on 11/13/15.
//  Copyright (c) 2015 Artifylabs. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate
{
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var RecordinginProgress: UILabel!
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    @IBAction func stopAudio(sender: UIButton) {
        println("Stopping the audio")
        RecordinginProgress.hidden = true
        if (audioRecorder.recording)
        {
            println("IM RECORDING")
        }
        else
        {
            println("IM NOT RECORDING")
        }
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    @IBAction func recordAudio(sender: UIButton)
    {
        RecordinginProgress.hidden = false
        stopButton.hidden = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let recordingName = "my_audio2.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)

        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        if (audioRecorder.record())
        {
            println("CALL TO RECORD SUCCESS")
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder!, error: NSError!) {
        println("ENCODE ERROR")
    }
    
    func audioRecorderDidFinsihRecording(recorder: AVAudioRecorder!, successfully flag: Bool)
    {
        println("AUDIO RECORDING FINISHED")
        if(flag)
        {
             recordedAudio = RecordedAudio()
             recordedAudio.filePathUrl = recorder.url
             recordedAudio.title = recorder.url.lastPathComponent
             self.performSegueWithIdentifier("stopAudio", sender: recordedAudio)
        }
        else
        {
            println("recording was not successful")
            recordButton.enabled = true
            stopButton.hidden = true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "stopAudio"){
            let PlaySoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
        
            let data = sender as! RecordedAudio
            PlaySoundsVC.receivedAudio = data
            //TODO: Record the user's voice
            println("in recordAudio")
        }
    }
    
    override func viewWillAppear(animated: Bool)
    {
        //make stop button disappear
        stopButton.hidden = true
        recordButton.enabled = true
    }
};