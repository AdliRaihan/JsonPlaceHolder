//
//  DashboardInteractor.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class DashboardInteractor: DashboardBusinessModel {
    private let presenter: DashboardPresenterModel
    init(presenter: DashboardPresenter) {
        self.presenter = presenter
    }
    func getUserArticle() {
        WorkerHelper.init().getUserArticle { [weak self] (result) in
            if case .success(let json) = result {
                self?.presenter.presentUserArticle(data: json)
            } else {
                self?.presenter.presentTasksFailed(message: nil)
            }
        }
    }
    func getPostsArticle() {
        WorkerHelper.init().getPostsData(completion: {
            [weak self] result in
            if case .success(let json) = result {
                self?.presenter.presentPostsArticle(data: json)
            } else {
                self?.presenter.presentTasksFailed(message: nil)
            }
        })
    }
}
