//
//  MyRoundButton.swift
//  CashMeOutside
//
//  Created by Anish Adhikari on 2/11/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

@IBDesignable class MyRoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
