//
//  ViewController.swift
//  VeryBasicEggTimer
//
//  Created by Remis on 2020-11-04.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var totalSeconds = 240

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    
    @IBAction func playPressed(_ sender: UIBarButtonItem) {

        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.processTimer), userInfo: nil, repeats: true)
        timer.tolerance = 0.10
        // Helps UI stay responsive even with timer.
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
        
    }
    
    @IBAction func minus10Pressed(_ sender: UIBarButtonItem) {
        if totalSeconds > 9 {
            totalSeconds -= 10
        }
        timeLabel.text = String(totalSeconds)
    }
    
    @IBAction func resetPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
        progressBar.progress = 1.0
        totalSeconds = 240
        timeLabel.text = String(totalSeconds)
    }
    
    @IBAction func plus10Pressed(_ sender: UIBarButtonItem) {
        
        if totalSeconds < 231 {
            totalSeconds += 10
        } else {
            totalSeconds = 240
        }
        
        timeLabel.text = String(totalSeconds)
    }
    
    
    @objc func processTimer(){

        if totalSeconds > 0 {
            totalSeconds -= 1
            timeLabel.text = String(totalSeconds)
            progressBar.progress = Float(totalSeconds) / 240
        } else {
            timer.invalidate()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(totalSeconds)
        progressBar.progress = 1.0
    }


}

