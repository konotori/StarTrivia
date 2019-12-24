//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/20/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
