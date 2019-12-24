//
//  ViewController.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/20/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController, PersonProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    var personApi = PersonAPI()
    var person: Person!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton(state: false)
    }
    
    // MARK: - Functions
    
    func setupButton(state: Bool) {
        homeworldBtn.isEnabled = state
        vehiclesBtn.isEnabled = state
        starshipsBtn.isEnabled = state
        filmsBtn.isEnabled = state
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
    
    // MARK: - Actions
    
    @IBAction func randomClicked(_ sender: UIButton) {
        let random = Int.random(in: 1 ... 87)
        spinner.startAnimating()
        personApi.getRandomPersonAlamo(id: random) { (person) in
            self.spinner.stopAnimating()
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}

protocol PersonProtocol {
    var person: Person! { get set }
}

