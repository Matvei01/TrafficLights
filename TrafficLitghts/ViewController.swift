//
//  ViewController.swift
//  TrafficLitghts
//
//  Created by Matvei Khlestov on 06.05.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var carrentLight = CurrentLight.red
    private var lightIsOn: CGFloat = 1
    private var lightIsOf: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOf
        yellowLight.alpha = lightIsOf
        greenLight.alpha = lightIsOf
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch carrentLight {
        case .red:
            redLight.alpha = lightIsOn
            greenLight.alpha = lightIsOf
            yellowLight.alpha = lightIsOf
            carrentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOf
            greenLight.alpha = lightIsOf
            yellowLight.alpha = lightIsOn
            carrentLight = .green
        case .green:
            redLight.alpha = lightIsOf
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOf
            carrentLight = .red
        }
        
    }
    
}

