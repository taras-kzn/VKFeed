//
//  NetworkService.swift
//  VKNews
//
//  Created by admin on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

protocol NetWorking {
    func request(path: String, param: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: NetWorking {

    let authService: AuthService
    
    init(authService: AuthService = AppDelegate.shared().authService) {
        self.authService = authService
    }
    
    func request(path: String, param: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else {return}
        var allParam = param
        allParam["access_token"] = token
        allParam["v"] = API.vers
        let url = self.url(from: path, param: allParam)
        let request = URLRequest(url: url)
        let task = creatDataTask(from: request, completion: completion)
        task.resume()
        print(url)
    }
    private func creatDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask{
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }

    
    private func url(from path: String, param: [String: String]) -> URL {
        
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = param.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}
