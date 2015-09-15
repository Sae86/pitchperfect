//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sae on 8/16/15.
//  Copyright (c) 2015 Sae. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        recordButton.enabled = true
    }
    
    @IBAction func recordStart(sender: UIButton) {
        recordLabel.hidden = false
        recordButton.enabled = false
        stopButton.hidden = false
        // TODO: record user's voice
        println("yay!!")
    }

    @IBAction func recordStop(sender: UIButton) {
        recordLabel.hidden = true
        // TODO: stop recording user's voice
        println("uuh!!")
    }
}

