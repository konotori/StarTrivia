//
//  HomeworldAPI.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldAPI {
    func getHomeworld(url: String, completion: @escaping HomeworldResponseCompletion ) {
        guard let url = URL(string: url) else { return }
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return
                completion(nil)
            }
            let jsonDeconder = JSONDecoder()
            do {
                let homeworld = try jsonDeconder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
