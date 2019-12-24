//
//  FilmAPI.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import Foundation
import Alamofire

class FilmAPI {
    func getFilms(url: String, completion: @escaping FilmResponseCompletion ) {
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
            let jsonDecoder = JSONDecoder()
            do {
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
