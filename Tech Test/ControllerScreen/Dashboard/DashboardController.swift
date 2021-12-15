//
//  DashboardController.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
import UIKit
class DashboardController: BaseController, DashboardViewModel {
    private var interactor: DashboardBusinessModel?
    private var postsModel: [PostModel] = []
    private var authorsModel: [UserModel] = []
    var screenData: [ArticleModel]?
    @IBOutlet private weak var tableView: CustomTableView?
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    deinit {
        print("Controller :: Deinit \(timeval())")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let presenter = DashboardPresenter(view: self)
        self.interactor = DashboardInteractor(presenter: presenter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.title = StaticString.screenArticle
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    private func setupUI() {
        self.setupNavigation()
        self.loadCell()
        self.showLoader {
            self.interactor?.getUserArticle()
        }
    }
    private func setupNavigation() {
        self.addBarButton(name: "Add Article", left: false) {
            [weak self] in
            self?.navigateToCreateScreen()
        }
    }
    func displayAuthorArticle(model: [UserModel]) {
        self.authorsModel.append(contentsOf: model)
        self.interactor?.getPostsArticle()
    }
    func displayPostsArticle(model: [PostModel]) {
        self.postsModel.append(contentsOf: model)
        PublicUtils.articleAuthorPosts(posts: self.postsModel, users: self.authorsModel, completion: {
            [weak self] filteredData in
            self?.screenData = filteredData
            self?.tableView?.reloadData()
            self?.dismissLoader()
        })
    }
    func displayTaskFailed(message: String?) {
        self.dismissLoader()
        self.showAlert(title: nil, description: StaticString.staticAlert)
    }
    private func purgeStoredVariable() {
        self.authorsModel.removeAll()
        self.postsModel.removeAll()
    }
}
extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    private func loadCell() {
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(.init(nibName: ArticleTableCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleTableCell.identifier)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        self.screenData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.screenData?[section].authorWriting.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let authorIndex = self.screenData?[indexPath.section]
        let postsIndex = authorIndex?.authorWriting[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableCell.identifier) as? ArticleTableCell
        cell?.loadAuthor(data: authorIndex?.authorDetails)
        cell?.loadPosts(data: postsIndex, grayed: indexPath.row % 2 != 0)
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = self.screenData?[indexPath.section].authorWriting[indexPath.row].id {
            self.navigateToDetailsScreen(selectedID: id)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension DashboardController {
    func navigateToDetailsScreen(selectedID: Int) {
        let targetController = DetailsController(selectedID: selectedID)
        self.navigationController?.pushViewController(targetController, animated: true)
    }
    func navigateToCreateScreen() {
        let targetController = CreateArticleController()
        self.navigationController?.pushViewController(targetController, animated: true)
    }
}
