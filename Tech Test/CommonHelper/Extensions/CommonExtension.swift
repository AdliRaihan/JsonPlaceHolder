//
//  CommonExtension.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//

import UIKit
extension UIViewController {
    func showAlert(title: String?, description: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title ?? "ERR: 0",
                                                message: description,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction.init(title: "ok", style: .default) { [weak alertController] (_ ) in
            guard alertController != nil else { return }
            completion?()
        }
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
