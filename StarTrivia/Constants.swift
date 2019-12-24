//
//  Constants.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/20/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
typealias StarshipResponseCompletion = (Starship?) -> Void
typealias FilmResponseCompletion = (Film?) -> Void
