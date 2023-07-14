//
//  ViewController.swift
//  TrafficLitghts
//
//  Created by Matvei Khlestov on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let redLight = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    private let yellowLight = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    private let greenLight = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    private let startButton = UIButton()
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOf: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSubviews(
            redLight,
            yellowLight,
            greenLight,
            startButton
        )
        
        setLightsIsOff()
        
        configure(redLight, with: .red)
        configure(yellowLight, with: .yellow)
        configure(greenLight, with: .green)
        
        setConstraintsFor(redLight)
        setConstraintsFor(yellowLight, equalTo: redLight)
        setConstraintsFor(greenLight, equalTo: yellowLight)
        
        startButtonConfigure()
        setConstraintsForStartButton()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    private func setLightsIsOff() {
        redLight.alpha = lightIsOf
        yellowLight.alpha = lightIsOf
        greenLight.alpha = lightIsOf
    }
    
    private func configure(_ light: UIView, with color: UIColor) {
        light.backgroundColor = color
        light.layer.cornerRadius = light.frame.width / 2
        light.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraintsFor(_ firstLight: UIView, equalTo secondLight: UIView? = nil) {
        if secondLight == nil {
            NSLayoutConstraint.activate(
                [
                    firstLight.topAnchor.constraint(
                        equalTo: view.safeAreaLayoutGuide.topAnchor,
                        constant: 35
                    ),
                    firstLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    firstLight.heightAnchor.constraint(equalToConstant: 150),
                    firstLight.widthAnchor.constraint(equalToConstant: 150)
                ]
            )
        } else {
            NSLayoutConstraint.activate(
                [
                    firstLight.topAnchor.constraint(
                        equalTo: secondLight?.bottomAnchor ?? NSLayoutYAxisAnchor(),
                        constant: 20
                    ),
                    firstLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    firstLight.heightAnchor.constraint(equalToConstant: 150),
                    firstLight.widthAnchor.constraint(equalToConstant: 150)
                ]
            )
        }
    }
    
    private func startButtonConfigure() {
        startButton.backgroundColor = .blue
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 25)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraintsForStartButton() {
        NSLayoutConstraint.activate(
            [
                startButton.leadingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 90
                ),
                startButton.trailingAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -90
                ),
                startButton.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -35
                )
            ]
        )
    }
    
    @objc private func startButtonTapped() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redLight.alpha = lightIsOn
            greenLight.alpha = lightIsOf
            yellowLight.alpha = lightIsOf
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOf
            greenLight.alpha = lightIsOf
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            redLight.alpha = lightIsOf
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOf
            currentLight = .red
        }
    }
}

extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}

