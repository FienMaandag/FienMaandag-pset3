//
//  AddMovieViewController.swift
//  FienMaandag-pset3
//
//  Created by Fien Maandag on 02-05-17.
//  Copyright © 2017 Fien Maandag. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    var MTitle: String?
    var MYear: String?
    var MDirector: String?
    var MPlot: String?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var moviePlot: UITextView!
    @IBOutlet weak var moviePoster: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = MTitle
        movieYear.text = MYear
        movieDirector.text = MDirector
        moviePlot.text = MPlot
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
