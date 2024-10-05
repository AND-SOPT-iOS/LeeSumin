//
//  UIView+.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/5/24.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {self.addSubview($0)}
    }
}
