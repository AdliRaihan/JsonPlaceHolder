//
//  CreateArticleInteractor.swift
//  Tech Test
//
//  Created by Adli Raihan on 15/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//

import Foundation
class CreateArticleInteractor: CreateArticleBusinessModel {
    private var presenter: CreateArticlePresenterModel?
    init(presenter: CreateArticlePresenterModel) {
        self.presenter = presenter
    }
    func setArticle(requestRaw: [String : String?]) {
        if let title = requestRaw["title"], let body = requestRaw["body"], title != nil, body != nil {
            let request: AddArticleRequestContext = AddArticleRequestContext(title: title, body: body, userId: 1)
            WorkerHelper.init().setArticle(parameterJson: request.json() ?? "") { (result) in
                if case .success(let json) = result {
                    self.presenter?.presentArticleAdded(data: json)
                } else {
                    self.presenter?.presentTaskFailed(message: nil)
                }
            }
        } else {
            self.presenter?.presentTaskFailed(message: "Cek kembali input!")
        }
    }
}
