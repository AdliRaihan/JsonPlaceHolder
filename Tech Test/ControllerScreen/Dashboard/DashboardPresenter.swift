//
//  DashboardPresenter.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class DashboardPresenter: DashboardPresenterModel {
    private var view: DashboardViewModel
    init(view: DashboardViewModel) {
        self.view = view
    }
    func presentUserArticle(data: [UserModel]) {
        self.view.displayAuthorArticle(model: data)
    }
    func presentPostsArticle(data: [PostModel]) {
        self.view.displayPostsArticle(model: data)
    }
    func presentTasksFailed(message: String?) {
        self.view.displayTaskFailed(message: message)
    }
}
extension DashboardPresenter {
}

