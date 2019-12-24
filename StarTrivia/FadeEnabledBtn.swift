//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/23/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class FadeEnabledBtn: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled == true {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
