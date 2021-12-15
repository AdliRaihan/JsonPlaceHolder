//
//  PublicUtils.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//

import Foundation
class PublicUtils {
    /// Menyatukan response author dan response posts dikarenakan placeholder json tidak menyediakan router untuk menampilkan post dan users sekaligus
    public static func articleAuthorPosts(
        posts: [PostModel],
        users: [UserModel],
        completion: @escaping ([ArticleModel]) -> Void) {
        // Kemungkinan proses parsing akan memakan waktu maka dari itu menggunakan background
        // applikasi tidak terlihat freeze
        let mergeTask = DispatchGroup()
        var distributionModel: [ArticleModel] = []
        mergeTask.enter()
        DispatchQueue.global(qos: .background).async {
            users.forEach { (model) in
                let filteredPosts = posts.filter({ $0.userId == model.id })
                distributionModel.append(ArticleModel(authorDetails: model, authorWriting: filteredPosts))
            }
            mergeTask.leave()
        }
        mergeTask.notify(queue: .main) {
            completion(distributionModel)
        }
    }
}
