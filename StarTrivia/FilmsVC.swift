//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Tung Nguyen on 12/24/19.
//  Copyright © 2019 Tung Nguyen. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var crawLbl: UITextView!
    
    // MARK: - Properties
    
    var person: Person!
    var filmApi = FilmAPI()
    var films = [String]()
    var currentFilm = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        films = person.filmUrls
        nextBtn.isEnabled = films.count > 0
        previousBtn.isEnabled = false
        getFilms(url: films[currentFilm])
    }
    
    // MARK: - Functions
    
    func getFilms(url: String) {
        filmApi.getFilms(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseData
        crawLbl.text = film.crawl
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false: true
        
        getFilms(url: films[currentFilm])
    }
    
    // MARK: - Actions
    
    @IBAction func previousClicked(_ sender: UIButton) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        currentFilm += 1
        setButtonState()
    }
}
