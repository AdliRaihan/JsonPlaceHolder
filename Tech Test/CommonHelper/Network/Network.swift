//
//  Network.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class Network {
    public static var shared = Network()
    func fetchData<R: Decodable>(
        section: EndpointSection,
        model: R.Type,
        completion: @escaping ((NetworkResults<R>) -> Void)) {
        let url = section.get()
        if let url = URL(string: url) {
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            let session = URLSession.shared
            DispatchQueue.global(qos: .background).async {
                session.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
                    DispatchQueue.main.async {
                        guard let _ = self else { return }
                        if let error = error {
                            completion(.failed(error: error))
                        } else {
                            do {
                                completion(.success(json: try JSONDecoder().decode(R.self, from: data!)))
                            } catch (let error) {
                                completion(.failed(error: error))
                            }
                        }
                    }
                }).resume()
            }
        }
    }
    func putData<R: Decodable>(
        section: EndpointSection,
        parameter: String /* Json */,
        model: R.Type,
        completion: @escaping((NetworkResults<R>) -> Void)) {
        let url = section.get()
        if let url = URL(string: url) {
            var request = URLRequest.init(url: url)
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
            request.httpMethod = "POST"
            let session = URLSession.shared
            DispatchQueue.global(qos: .background).async {
                session.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
                    DispatchQueue.main.async {
                        guard let _ = self else { return }
                        if let error = error {
                            completion(.failed(error: error))
                        } else {
                            do {
                                completion(.success(json: try JSONDecoder().decode(R.self, from: data!)))
                            } catch (let error) {
                                completion(.failed(error: error))
                            }
                        }
                    }
                }).resume()
            }
        }
    }
    // Tidak memakai placeholder karena tidak ada image
    func loadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: url) {
            DispatchQueue.global(qos: .background).async {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    DispatchQueue.main.async {
                        if let data = data {
                            completion(UIImage.init(data: data))
                        } else {
                            completion(nil)
                        }
                    }
                }.resume()
            }
        }
    }
}
