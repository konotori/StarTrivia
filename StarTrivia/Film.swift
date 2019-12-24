//
//  Film.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import Foundation

struct Film: Codable {
    let title: String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseData: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case crawl = "opening_crawl"
        case director
        case producer
        case releaseData = "release_date"
    }
}
