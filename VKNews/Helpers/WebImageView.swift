//
//  WebImageView.swift
//  VKNews
//
//  Created by admin on 29/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    func set(imageUrl: String){
        guard let url = URL(string: imageUrl) else {return}
        
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)){
            self.image = UIImage(data: cacheResponse.data)
            print("from cach")
            return
        }
        print("from internet")
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response{
                    self?.image = UIImage(data: data)
                    self?.loadedImage(data: data, urlresponse: response)
                }
            }
        }
        dataTask.resume()
    }
    private func loadedImage(data: Data, urlresponse: URLResponse) {
        guard let responseURL = urlresponse.url else {return}
        let cacheResponse = CachedURLResponse(response: urlresponse, data: data)
        URLCache.shared.storeCachedResponse(cacheResponse, for: URLRequest(url: responseURL))
        
        
    }
}
