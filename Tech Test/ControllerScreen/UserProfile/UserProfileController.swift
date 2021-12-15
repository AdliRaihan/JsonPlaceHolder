//
//  UserProfileController.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class UserProfileController: BaseController, UserProfileViewModel {
    @IBOutlet private weak var contentStackView: UIStackView?
    private var interactor: UserProfileBusinessModel?
    private var OTRead: boolean_t = 0
    public var taskAvailable: Bool {
        get { OTRead == 0 }
    }
    var userDetails: UserModel?
    init(userID: Int) {
        super.init(nibName: "UserDetailsViewScreen", bundle: nil)
        let presenter = UserProfilePresenter(view: self)
        self.interactor = UserProfileInteractor(presenter: presenter, userID: userID)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard taskAvailable else { return }
        self.showLoader {
            self.interactor?.getUserDetails()
        }
        self.title = StaticString.screenUser
    }
    func displayUserDetails(views: [UIView]) {
        self.dismissLoader()
        self.taskFinished()
        if self.contentStackView?.subviews.count ?? -1 > 0 {
            // refresh content - Jika di perlukan
            self.contentStackView?.subviews.forEach({$0.removeFromSuperview()})
        }
        views.forEach({ self.contentStackView?.addArrangedSubview($0) })
        self.interactor?.getUserAlbums()
    }
    func displayAlbums(views: CollectionViewHolder) {
        guard let countStackViews = self.contentStackView?.subviews.count else { return }
        self.contentStackView?.insertArrangedSubview(views, at: countStackViews)
        views.load()
    }
    func displayClickedEntity(value: String) {
        callNumber(number: value)
    }
    private func taskFinished() {
        self.OTRead = 1
    }
    func displayTaskFailed(message: String?) {
        self.dismissLoader()
        self.showAlert(title: nil, description: StaticString.staticAlert) {
            [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard !(self.navigationController?.viewControllers.contains(self) ?? false) else { return }
        self.contentStackView?.removeFromSuperview()
    }
}
extension UserProfileController {
    func callNumber(number: String) {
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.canOpenURL(url)
        } else {
            // tidak bisa di test karena tidak memiliki real device, simulator tidak bisa melakkukan pengetesan pemanggilan nomor
            self.showAlert(title: "Tidak dapat melakukan panggilan", description: "panggilan ke nomor \(number) tidak dapat dilanjutkan, karena fitur tidak tersedia!")
        }
    }
}
