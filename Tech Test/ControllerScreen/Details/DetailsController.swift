//
//  DetailsController.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class DetailsController: BaseController, DetailsViewModel {
    deinit {
        print("User Details Deinit")
    }
    private var interactor: DetailsBusinessModel?
    private var dataModel: [PostModel] = []
    internal var detailsInformation: PostModel?
    internal var commentDetails: [CommentModel]?
    @IBOutlet private weak var tableView: CustomTableView?
    init(selectedID: Int) {
        super.init(nibName: "DetailsViewScreen", bundle: nil)
        let presenter = DetailsPresenter(view: self)
        self.interactor = DetailsInteractor(presenter: presenter, selectedID: selectedID)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCell()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLoader {
            self.interactor?.getPostDetailById()
            self.interactor?.getCommentPostDetail()
        }
    }
    func displaySelectedArticle(model: PostModel) {
        self.detailsInformation = model
        self.dismissLoader()
        self.tableView?.reloadData()
    }
    func displayCommentFromSelectedArticle(model: [CommentModel]) {
        self.commentDetails = model
        self.tableView?.reloadData()
    }
    func displayTaskFailed(message: String?) {
        self.dismissLoader()
        self.showAlert(title: nil, description: StaticString.staticAlert) {
            [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}
extension DetailsController: UITableViewDelegate, UITableViewDataSource {
    private func loadCell() {
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(.init(nibName: ArticleHeaderDetailsTableCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleHeaderDetailsTableCell.identifier)
        self.tableView?.register(.init(nibName: ArticleCommentDetails.identifier, bundle: nil), forCellReuseIdentifier: ArticleCommentDetails.identifier)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        (self.detailsInformation == nil) ? 0 : 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return self.commentDetails?.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return self.configureCellForHeaderDetails()
        default:
            return self.configureCellForComment(on: indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section > 0 else { return nil }
        return "Komentar (\(self.commentDetails?.count ?? 0))"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    private func configureCellForHeaderDetails() -> UITableViewCell {
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: ArticleHeaderDetailsTableCell.identifier) as? ArticleHeaderDetailsTableCell
        cell?.loadInformation(data: self.detailsInformation)
        return cell ?? UITableViewCell()
    }
    private func configureCellForComment(on index: Int) -> UITableViewCell {
        let data = self.commentDetails?[index]
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: ArticleCommentDetails.identifier) as? ArticleCommentDetails
        cell?.loadComment(data: data)
        cell?.usernameCallback = {
            [weak self] in
            guard self != nil else { return }
            self?.navigateToProfileDetailsScreen(userId: self?.commentDetails?[index].id)
        }
        return cell ?? UITableViewCell()
    }
}
extension DetailsController {
    func navigateToProfileDetailsScreen(userId: Int?) {
        guard let userId = userId else { return }
        let targetController = UserProfileController(userID: userId)
        self.navigationController?.pushViewController(targetController, animated: true)
    }
}
