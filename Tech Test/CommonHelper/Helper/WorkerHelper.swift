//
//  WorkerHelper.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
enum WorkerResult<T: Decodable> {
    case success(T)
    case failed
}
class WorkerHelper {
    func getPostsData(completion: @escaping (WorkerResult<[PostModel]>) -> Void) {
        Network.shared.fetchData(section: .posts(id: nil), model: [PostModel].self) { (result) in
            switch result {
            case .success(let json):
                /*
                    Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                    Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                */
                completion(.failed)
            }
        }
    }
    func getPostsDetailsData(id: String? = nil, completion: @escaping (WorkerResult<PostModel>) -> Void) {
        Network.shared.fetchData(section: .posts(id: id), model: PostModel.self) { (result) in
            switch result {
            case .success(let json):
                /*
                    Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                    Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                */
                completion(.failed)
            }
        }
    }
    func getPostsComments(postId: String, completion: @escaping (WorkerResult<[CommentModel]>) -> Void) {
        Network.shared.fetchData(section: .postsComment(id: postId), model: [CommentModel].self) { (result) in
            switch result {
            case .success(let json):
                /*
                 Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                 Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                 */
                completion(.failed)
            }
        }
    }
    func getUserArticle(completion: @escaping (WorkerResult<[UserModel]>) -> Void) {
        Network.shared.fetchData(section: .usersPosts, model: [UserModel].self) { (result) in
            switch result {
            case .success(let json):
                /*
                 Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                 Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                 */
                completion(.failed)
            }
        }
    }
    func getUserProfile(userId: String, completion: @escaping (WorkerResult<UserModel>) -> Void) {
        Network.shared.fetchData(section: .userProfile(id: userId), model: UserModel.self) { (result) in
            switch result {
            case .success(let json):
                /*
                 Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                 Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                 */
                completion(.failed)
            }
        }
    }
    func getUserAlbums(userId: String, completion: @escaping (WorkerResult<[AlbumsModel]>) -> Void) {
        Network.shared.fetchData(section: .albums(id: userId), model: [AlbumsModel].self) { (result) in
            switch result {
            case .success(let json):
                /*
                 Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                 Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                 */
                completion(.failed)
            }
        }
    }
    func setArticle(parameterJson: String, completion: @escaping (WorkerResult<PostModel>) -> Void) {
        Network.shared.putData(section: .posts(id: nil), parameter: parameterJson, model: PostModel.self) { (result) in
            switch result {
            case .success(let json):
                /*
                    Completion diberikan untuk caller
                 */
                completion(.success(json))
            case .failed(_ ):
                /*
                    Tidak di impelentasi karena tidak ada response balikan selain technical issue dari API
                */
                completion(.failed)
            }
        }
    }
}
