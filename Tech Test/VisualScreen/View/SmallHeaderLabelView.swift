//
//  SmallHeaderLabelView.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
enum SmallHeaderUISetup {
    case header
    case smallHeader
    case noHeader
}
class SmallHeaderLabelView: UIView {
    @IBOutlet private weak var contentView: UIView?
    @IBOutlet private weak var separatorView: UIView?
    @IBOutlet private weak var headerLabel: UILabel?
    @IBOutlet private weak var descLabel: UILabel?
    private var onTapAction: (() -> Void)? = nil
    deinit {
        print("Small Header Deinit!")
    }
    public static func instatiateView(
        lVal: String? = nil,
        rVal: String? = nil,
        contentSetup: SmallHeaderUISetup = .smallHeader,
        displaySeparator: Bool = false) -> SmallHeaderLabelView {
        let displayer = SmallHeaderLabelView()
        displayer.displayFromValue(headerValue: lVal, descriptionValue: rVal, contentSetup: contentSetup)
        displayer.separatorView?.isHidden = !displaySeparator
        return displayer
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        getDisplay()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        getDisplay()
    }
    private func getDisplay() {
        Bundle.main.loadNibNamed("SmallHeaderLabelView", owner: self, options: nil)
        if let contentView = contentView {
            addSubview(contentView)
        }
        contentView?.frame = self.bounds
        contentView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.setUI()
    }
    private func setUI() {
        self.headerLabel?.setNotesFont(weight: .semibold)
        self.headerLabel?.textColor = .lightGray
        self.descLabel?.setDescriptionFont()
    }
    public func displayFromValue(headerValue: String?,
                                 descriptionValue: String? = nil,
                                 contentSetup: SmallHeaderUISetup = .smallHeader) {
        switch contentSetup {
        case .header:
            self.headerLabel?.setTitleFont()
            self.headerLabel?.textColor = .black
            self.descLabel?.isHidden = true
        case .noHeader:
            self.headerLabel?.isHidden = true
            self.descLabel?.isHidden = false
        default:
            break
        }
        self.headerLabel?.text = headerValue
        self.descLabel?.text = descriptionValue
    }
    public func createGesture(tapAction: @escaping () -> Void) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapped(_:)))
        self.onTapAction = tapAction
        self.addGestureRecognizer(gesture)
    }
    @objc private func onTapped(_ sender: Any) {
        self.onTapAction?()
    }
    override func removeFromSuperview() {
        self.onTapAction = nil
        super.removeFromSuperview()
    }
}
