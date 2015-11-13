//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Hayley Cundiff on 11/13/15.
//  Copyright (c) 2015 Artifylabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!

    @IBOutlet weak var RecordinginProgress: UILabel!
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
        
    }

     func recordAudio(sender: UIButton) {
        RecordinginProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
        
        
        //TODO: Record the user's voice
        println("in recordAudio")
    }
    
    override func viewWillAppear(animated: Bool) {
        //make stop button disappear
        stopButton.hidden = true
        recordButton.enabled = true 
    }
}