//
//  DetailsProtocol.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
protocol DetailsBusinessModel {
    func getPostDetailById()
    func getCommentPostDetail()
}
protocol DetailsPresenterModel {
    func presentSelectedArticle(data: PostModel)
    func presentCommentPostDetail(data: [CommentModel])
    func presentTasksFailed(message: String?)
}
protocol DetailsViewModel {
    var detailsInformation: PostModel? { get }
    var commentDetails: [CommentModel]? { get }
    func displaySelectedArticle(model: PostModel)
    func displayCommentFromSelectedArticle(model: [CommentModel])
    func displayTaskFailed(message: String?)
}
protocol DetailsDataRouter {
    var selectedID: Int { get }
}
