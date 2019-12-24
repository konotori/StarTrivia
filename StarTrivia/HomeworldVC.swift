//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    // MARK: - Properties
    
    var person: Person!
    let homewordlApi = HomeworldAPI()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homewordlApi.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupView(homeworld: homeworld)
            }
        }
    }
    
    // MARK: - Functions
    
    func setupView(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
}
