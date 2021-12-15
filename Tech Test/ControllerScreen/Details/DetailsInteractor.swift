//
//  DetailsInteractor.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class DetailsInteractor: DetailsBusinessModel, DetailsDataRouter {
    internal var selectedID: Int
    private let presenter: DetailsPresenterModel
    // Pengalihan screen ke details tidak bisa dilanjutkan apabila tanpa `data`
    init(presenter: DetailsPresenter, selectedID: Int) {
        self.presenter = presenter
        self.selectedID = selectedID
    }
    func getPostDetailById() {
        WorkerHelper.init().getPostsDetailsData(id: "\(selectedID)") { [weak self] (result) in
            if case .success(let json) = result {
                self?.presenter.presentSelectedArticle(data: json)
            } else {
                self?.presenter.presentTasksFailed(message: nil)
            }
        }
    }
    func getCommentPostDetail() {
        WorkerHelper.init().getPostsComments(postId: "\(selectedID)") { [weak self] (result) in
            if case .success(let json) = result {
                self?.presenter.presentCommentPostDetail(data: json)
            } else {
                self?.presenter.presentTasksFailed(message: nil)
            }
        }
    }
}
