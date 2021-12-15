//
//  ViewController.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class BaseController: UIViewController {
    private var navigationRightButtonAction: (() -> Void)?
    private var loaderView: CustomLoader?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private func instatiateLoaderView() {
        autoreleasepool {
            self.loaderView = CustomLoader(frame: self.view.frame)
            self.loaderView?.isHidden = true
        }
    }
    internal func showLoader(action: (() -> Void)? = nil) {
        if self.loaderView == nil {
            self.instatiateLoaderView()
        }
        if let loader = self.loaderView {
            self.view.insertSubview(loader, at: self.view.subviews.count + 1)
        }
        self.loaderView?.isHidden = false
        action?()
    }
    internal func dismissLoader() {
        if self.loaderView == nil {
            return
        }
        self.loaderView?.removeFromSuperview()
        self.loaderView = nil
    }
    internal func addBarButton(name: String, left: Bool = true, action: (() -> Void)? = nil) {
        let __reserved = UIBarButtonItem.init(title: name, style: .done, target: self, action: #selector(triggerAction(_:)))
        self.navigationRightButtonAction = action
        if left {
            self.navigationItem.leftBarButtonItem = __reserved
        } else {
            self.navigationItem.rightBarButtonItem = __reserved
        }
    }
    @objc private func triggerAction(_ sender: Any) {
        self.navigationRightButtonAction?()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Solve memory--dump
        self.dismissLoader()
    }
}

