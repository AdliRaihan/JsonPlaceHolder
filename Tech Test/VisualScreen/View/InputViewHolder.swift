//
//  InputViewHolder.swift
//  Tech Test
//
//  Created by Adli Raihan on 15/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//

import UIKit
enum InputViewHolderContentPreview {
    case smallInput
    case largeInput
}
class InputViewHolder: UIView {
    @IBOutlet private weak var contentView: UIView?
    @IBOutlet private weak var headerLabel: UILabel?
    @IBOutlet private weak var inputText: UITextField?
    @IBOutlet private weak var heightMeasurement: NSLayoutConstraint?
    private var title: String?
    private var section: InputViewHolderContentPreview?
    public var value: String? {
        get {
            if let text = inputText?.text, text != "" {
                return text
            } else {
                return nil
            }
        }
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    public static func instatiateView(type:InputViewHolderContentPreview, title: String) -> InputViewHolder {
        let displayer = InputViewHolder()
        displayer.title = title
        displayer.section = type
        return displayer
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        getDisplay()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        getDisplay()
    }
    func getDisplay() {
        Bundle.main.loadNibNamed("InputViewHolder", owner: self, options: nil)
        if let contentView = contentView {
            addSubview(contentView)
        }
        contentView?.frame = self.bounds
        contentView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.headerLabel?.setDescriptionFont(weight: .semibold)
        self.headerLabel?.textColor = .gray
    }
    public func load() {
        self.headerLabel?.text = self.title
        switch section {
        case .largeInput:
            self.heightMeasurement?.constant = 144.0
        default:
            self.heightMeasurement?.constant = 44.0
        }
    }
}
