//
//  NetworkDataFeetcher.swift
//  VKNews
//
//  Created by admin on 27/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

protocol DataFtcher {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
}

struct NetworkDataFeetcher: DataFtcher {
    
    let netWorking: NetWorking
    
    init(netWorking: NetWorking) {
        self.netWorking = netWorking
    }
    func getFeed(response: @escaping (FeedResponse?) -> Void) {
        let param = ["filters": "post, photo"]
        
        netWorking.request(path: API.newsFeed, param: param) { (data, error) in
            if let error = error {
                print("Error recevid requesting data: \(error.localizedDescription)")
                response(nil )
            }
            
            let decode = self.decodeJson(type: FeedResponseWrapped.self, from: data)
            response(decode?.response)
        }
    }
    
    private func decodeJson<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else {return nil}
        return response
    }
    
}
