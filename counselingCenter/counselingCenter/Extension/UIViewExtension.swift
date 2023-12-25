//
//  UIViewExtension.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/25.
//

import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
