//
//  UILabel+.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/11/24.
//

import UIKit

extension UILabel {
    func setLabel(textColor: UIColor, font: UIFont, text: String? = "", alignment: NSTextAlignment = .center, numberOfLines: Int = 0) {
        self.textColor = textColor
        self.font = font
        self.text = text
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
}
