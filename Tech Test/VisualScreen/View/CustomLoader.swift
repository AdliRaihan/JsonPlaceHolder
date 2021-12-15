//
//  CustomLoader.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class CustomLoader: UIView {
    @IBOutlet private weak var contentView: UIView?
    @IBOutlet private weak var loaderIndicator: UIActivityIndicatorView?
    deinit {
        print("Checking if this dealloc properly?")
    }
    public var isShowing: Bool {
        get {
            self.contentView?.alpha == 1
        }
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
    func getDisplay() {
        Bundle.main.loadNibNamed("CustomLoader", owner: self, options: nil)
        if let contentView = contentView {
            addSubview(contentView)
        }
        self.contentView?.alpha = 0
        contentView?.frame = self.bounds
        contentView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.loaderIndicator?.startAnimating()
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.contentView?.alpha = 1
            self?.layoutSubviews()
        }
    }
    func displayView() -> UIView? {
        let nib = UINib.init(nibName: "CustomLoader", bundle: Bundle.main)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
