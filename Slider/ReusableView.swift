//
//  ReusableView.swift
//  Slider
//
//  Created by Vova on 07.05.22.
//

import UIKit

class ReusableVIew: UIView {
    
    var slider: UISlider!
    var label: UILabel!
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        initSlider()
        initLabel()
        constructHierarchy()
        activatConstraints()
    }
}

extension ReusableVIew {
    func initSlider() {
        slider = UISlider()
//        "Red: \(s(String(redColorSlider.slider.value*255)))"
        slider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initLabel() {
        label = UILabel()
         label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        addSubview(slider)
        addSubview(label)
    }
    
    func activatConstraints() {
        NSLayoutConstraint.activate([
            slider.leftAnchor.constraint(equalTo: leftAnchor),
            slider.rightAnchor.constraint(equalTo: rightAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            label.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -3),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
