//
//  CustomTableView.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class CustomTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 44.0
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
