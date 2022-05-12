//
//  ViewController.swift
//  Slider
//
//  Created by Vova on 07.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    var sizeControlSlider: ReusableVIew!
    var redColorSlider: ReusableVIew!
    var greenColorSlider: ReusableVIew!
    var blueColorSlider: ReusableVIew!
    var numbersLabel: UILabel!
    var generalLabel: UILabel!
    var segmentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        initSizeControlSlider()
        initRedColorSlider()
        initGreenColorSlider()
        initBlueColorSlider()
        initNumbersLabel()
        initGeneralLabel()
        initSegmentControl()
        constructHierarchy()
        activatConstraints()
        

        sizeControlSlider.slider.addTarget(self, action: #selector(sizeControlSliderChange), for: .valueChanged)
        redColorSlider.slider.addTarget(self, action: #selector(colorSliderChange), for: .valueChanged)
        greenColorSlider.slider.addTarget(self, action: #selector(colorSliderChange), for: .valueChanged)
        blueColorSlider.slider.addTarget(self, action: #selector(colorSliderChange), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(segmentControlChange), for: .valueChanged)
    }
    
    @objc func sizeControlSliderChange(sender: UISlider) {
        numbersLabel.text = "Size control: \((String(sender.value*120)))"
        generalLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value)*120)
    }

    @objc func colorSliderChange() {
        let red = CGFloat(redColorSlider.slider.value)
        let green = CGFloat(greenColorSlider.slider.value)
        let blue = CGFloat(blueColorSlider.slider.value)
        
        generalLabel.textColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @objc func segmentControlChange() {
        if segmentControl.selectedSegmentIndex == 0 {
            generalLabel.font = UIFont.systemFont(ofSize: CGFloat(sizeControlSlider.slider.value*120), weight: .ultraLight)
        } else if segmentControl.selectedSegmentIndex == 1 {
            generalLabel.font = UIFont.systemFont(ofSize: CGFloat(sizeControlSlider.slider.value*120), weight: .light)
        } else if segmentControl.selectedSegmentIndex == 2 {
            generalLabel.font = UIFont.systemFont(ofSize: CGFloat(sizeControlSlider.slider.value*120), weight: .bold)
        }
    }
}

extension ViewController {
    func initSizeControlSlider() {
        sizeControlSlider = ReusableVIew()
        sizeControlSlider.translatesAutoresizingMaskIntoConstraints = false
    }


    func initRedColorSlider() {
        redColorSlider = ReusableVIew()
        redColorSlider.label.text = "Red"
        redColorSlider.label.textColor = .red
        redColorSlider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initGreenColorSlider() {
        greenColorSlider = ReusableVIew()
        greenColorSlider.label.text = "Grenn"
        greenColorSlider.label.textColor = .green
        greenColorSlider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initBlueColorSlider() {
        blueColorSlider = ReusableVIew()
        blueColorSlider.label.text = "Blue"
        blueColorSlider.label.textColor = .blue
        blueColorSlider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initNumbersLabel() {
        numbersLabel = UILabel()
        numbersLabel.text = "Size control: 0.0"
        numbersLabel.font = UIFont.systemFont(ofSize: 13)
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func initGeneralLabel() {
        generalLabel = UILabel()
        generalLabel.text = "X"
        generalLabel.textAlignment = .center
        generalLabel.clipsToBounds = true
        generalLabel.layer.cornerRadius = 10
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initSegmentControl() {
        segmentControl = UISegmentedControl(items: ["Thin", "Medium", "Thick"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func constructHierarchy() {
        view.addSubview(sizeControlSlider)
        view.addSubview(redColorSlider)
        view.addSubview(greenColorSlider)
        view.addSubview(blueColorSlider)
        view.addSubview(numbersLabel)
        view.addSubview(generalLabel)
        view.addSubview(segmentControl)
    }

    func activatConstraints() {
        NSLayoutConstraint.activate([
            generalLabel.heightAnchor.constraint(equalToConstant: 100),
            generalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            generalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            generalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            numbersLabel.bottomAnchor.constraint(equalTo: sizeControlSlider.topAnchor, constant: 10),
            numbersLabel.trailingAnchor.constraint(equalTo: sizeControlSlider.trailingAnchor),
            numbersLabel.heightAnchor.constraint(equalToConstant: 10),
            
            sizeControlSlider.heightAnchor.constraint(equalToConstant: 50),
            sizeControlSlider.label.topAnchor.constraint(equalTo: generalLabel.bottomAnchor, constant: 20),
            sizeControlSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            sizeControlSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            redColorSlider.heightAnchor.constraint(equalToConstant: 50),
            redColorSlider.label.topAnchor.constraint(equalTo: sizeControlSlider.topAnchor, constant: 50),
            redColorSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            redColorSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            greenColorSlider.heightAnchor.constraint(equalToConstant: 50),
            greenColorSlider.label.topAnchor.constraint(equalTo: redColorSlider.topAnchor, constant: 50),
            greenColorSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            greenColorSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            blueColorSlider.heightAnchor.constraint(equalToConstant: 50),
            blueColorSlider.label.topAnchor.constraint(equalTo: greenColorSlider.topAnchor, constant: 50),
            blueColorSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            blueColorSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            segmentControl.topAnchor.constraint(equalTo: blueColorSlider.bottomAnchor, constant: 30),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
}
