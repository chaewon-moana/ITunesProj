//
//  UIView+Extension.swift
//  ITunesProj
//
//  Created by cho on 4/7/24.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
