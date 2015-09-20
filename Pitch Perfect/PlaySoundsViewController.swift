//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sae on 9/13/15.
//  Copyright (c) 2015 Sae. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    // From review: More effects
    // What about more effects? :)
    // How to create the reverb effect:
    // Stop all audio
    // Create an instance of AVAudioPlayerNode
    // Attach this variable to the audioEngine previously created
    // Create an instance of AVAudioUnitReverb
    // Use loadFactoryPreset to configure the Reverb Audio Unit
    // Apply the wetDryMix (normally 50 is enough)
    // Attach the instance of AVAudioUnitReverb you created to the audioEngine previously created
    // Connect your instance of AVAudioPlayerNode to the AVAudioUnitReverb using .connect
    // Connect your instance of AVAudioUnitReverb to your outputNode's audioEngine
    // Use the startAndReturnError(nil) property in your audioEngine instance
    // Play the instance of AVAudioPlayerNode
    // TODO: Draw reverb Icon... Maybe more effects???
    
    @IBAction func playSlowAudio(sender: UIButton) {
        // play audio slowly
        playAudioWithVariableRate(0.5)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        // play audio fast
        playAudioWithVariableRate(1.5)
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func stopAllAudio(){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func playAudioWithVariableRate(rate: Float){
        stopAllAudio()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stopAllAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        stopAllAudio()
    }
}
