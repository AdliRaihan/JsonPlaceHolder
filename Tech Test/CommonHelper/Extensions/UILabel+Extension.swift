//
//  UIFont+Extension.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//

import UIKit
extension UILabel {
    func setTitleFont(weight: UIFont.Weight = .bold) {
        self.font = UIFont.systemFont(ofSize: 22.0, weight: weight)
    }
    func setDescriptionFont(weight: UIFont.Weight = .regular) {
        self.font = UIFont.systemFont(ofSize: 14.0, weight: weight)
    }
    func setNotesFont(weight: UIFont.Weight = .thin) {
        self.font = UIFont.systemFont(ofSize: 12.0, weight: weight)
    }
}
