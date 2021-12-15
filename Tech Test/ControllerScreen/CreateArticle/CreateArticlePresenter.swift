//
//  CreateArticlePresenter.swift
//  Tech Test
//
//  Created by Adli Raihan on 15/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class CreateArticlePresenter: CreateArticlePresenterModel {
    private var view: CreateArticleViewModel?
    init(view: CreateArticleViewModel?) {
        self.view = view
    }
    func presentArticleAdded(data: PostModel) {
        self.view?.displayArticleAdded(model: data)
    }
    func presentTaskFailed(message: String?) {
        self.view?.displayTaskFailed(message: message)
    }
}
