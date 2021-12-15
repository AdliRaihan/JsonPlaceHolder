//
//  CreateArticleController.swift
//  Tech Test
//
//  Created by Adli Raihan on 15/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
// MARK: Sesuai dokumentasi
// - https://jsonplaceholder.typicode.com/guide/
// Important: resource will not be really updated on the server but it will be faked as if.
class CreateArticleController: BaseController, CreateArticleViewModel {
    @IBOutlet private weak var contentStackView: UIStackView?
    private var inputTitle: InputViewHolder?
    private var inputBody: InputViewHolder?
    private var interactor: CreateArticleBusinessModel?
    init() {
        super.init(nibName: "CreateArticleViewScreen", bundle: Bundle.main)
        let presenter = CreateArticlePresenter(view: self)
        self.interactor = CreateArticleInteractor(presenter: presenter)
    }
    deinit {
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupUI()
    }
    private func setupUI() {
        // @ignore - breaking constant log, breaking constraint ini false positive.
        inputTitle = .instatiateView(type: .smallInput, title: "Title")
        // @ignore linting - - - to//do// replace textfield -> textview untuk input body
        inputBody = .instatiateView(type: .smallInput, title: "Body")
        if let inputTitle = inputTitle, let inputBody = inputBody {
            self.contentStackView?.addArrangedSubview(inputTitle)
            self.contentStackView?.addArrangedSubview(inputBody)
            inputTitle.load()
            inputBody.load()
        } else {
            self.displayTaskFailed(message: nil)
        }
    }
    func displayArticleAdded(model: PostModel) {
        self.showAlert(title: "Code: \(model.id ?? 0)", description: "Article Berhasil di tambahkan!") {
            [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    func displayTaskFailed(message: String?) {
        self.showAlert(title: nil, description: message ?? StaticString.staticAlert)
    }
    @IBAction private func submitSelected(_ sender: Any) {
        self.interactor?.setArticle(requestRaw: ["title": inputTitle?.value, "body": inputBody?.value])
    }
}
