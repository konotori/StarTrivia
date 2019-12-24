//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
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
    let vehicleApi = VehiclesAPI()
    var vehicles = [String]()
    var currentVehicle = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicles = person.vehicleUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = vehicles.count > 1
        getVehicle(url: vehicles[currentVehicle])
    }
    
    // MARK: - Functions
    
    func getVehicle(url: String) {
        vehicleApi.getVehicles(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        makerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lenghtLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false: true
        
        getVehicle(url: vehicles[currentVehicle])
    }
    
    // MARK: - Actions
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
        
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
}
