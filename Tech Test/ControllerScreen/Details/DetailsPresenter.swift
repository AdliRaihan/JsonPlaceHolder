//
//  DetailsPresenter.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class DetailsPresenter: DetailsPresenterModel {
    private let view: DetailsViewModel
    init(view: DetailsViewModel) {
        self.view = view
    }
    func presentSelectedArticle(data: PostModel) {
        self.view.displaySelectedArticle(model: data)
    }
    func presentCommentPostDetail(data: [CommentModel]) {
        self.view.displayCommentFromSelectedArticle(model: data)
    }
    func presentTasksFailed(message: String?) {
        self.view.displayTaskFailed(message: message)
    }
}
