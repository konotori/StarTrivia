//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lenghtLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    // MARK: - Properties
    
    var person: Person!
    let starshipApi = StarshipAPI()
    var starships = [String]()
    var currentStarship = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starships = person.starshipUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starships.count > 1
        getStarship(url: starships[currentStarship])
    }
    
    // MARK: - Functions
    
    func getStarship(url: String) {
        starshipApi.getStarships(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lenghtLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false: true
        
        getStarship(url: starships[currentStarship])
    }
    
    // MARK: - Actions
    
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
        
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
}
