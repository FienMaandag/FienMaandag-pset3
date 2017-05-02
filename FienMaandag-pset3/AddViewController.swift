//
//  AddViewController.swift
//  FienMaandag-pset3
//
//  Created by Fien Maandag on 02-05-17.
//  Copyright © 2017 Fien Maandag. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    
    var movieTitle: String?
    var movieYear: String?
    var movieDirector: String?
    var moviePlot: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let searchTitle = titleInput.text
        let emptyUrl = "https://omdbapi.com/?t="
        let url = URL(string: emptyUrl + searchTitle!)
        
        URLSession.shared.dataTask(with:url!)  { (data, response, error) in
            if error != nil {
                print(error ?? "error")
            }
                
            else {
                do{
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    let title = parsedData["Title"] as! String?
                    let plot = parsedData["Plot"] as! String?
                    let year = parsedData["Year"] as! String?
                    let director = parsedData["Director"] as! String?
                    // TO DO
                    // get image
                    
                    // TO DO
                    // is loaded to late maybe add this information to prepare segue
                    DispatchQueue.global().async {
                        DispatchQueue.main.async {
                            self.movieTitle = title!
                            self.movieYear = year!
                            self.movieDirector = director!
                            self.moviePlot = plot!
                            // TO DO
                            // add image to posterImage
                        }
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            }.resume()

        
        if let addMovieVC = segue.destination as? AddMovieViewController{
            addMovieVC.MTitle = movieTitle
            addMovieVC.MYear = movieYear
            addMovieVC.MDirector = movieDirector
            addMovieVC.MPlot = moviePlot
        }
    }
}
