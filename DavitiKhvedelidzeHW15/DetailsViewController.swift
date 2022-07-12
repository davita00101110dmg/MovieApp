//
//  DetailsViewController.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import UIKit

class DetailsViewController: ViewController {
    
    
    @IBOutlet weak var movieTitleField: UILabel!
    @IBOutlet weak var movieReleaseDateField: UILabel!
    @IBOutlet weak var movieRatingField: UILabel!
    @IBOutlet weak var movieMainActorField: UILabel!
    @IBOutlet weak var movieSeenField: UILabel!
    @IBOutlet weak var movieisFavouriteField: UILabel!
    @IBOutlet weak var movieDescField: UILabel!
    
    var movieTitle: String?
    var movieReleaseDate: String?
    var movieRating: String?
    var movieMainActor: String?
    var movieSeen: String?
    var movieIsFavourite: String?
    var movieDesc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleField.text = movieTitle
        movieReleaseDateField.text = movieReleaseDate
        movieRatingField.text = movieRating
        movieMainActorField.text = movieMainActor
        movieSeenField.text = movieSeen
        movieisFavouriteField.text = movieIsFavourite
        movieDescField.text = movieDesc
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeFavourite(_ sender: Any) {
        movieIsFavourite = movieIsFavourite == "Favourite" ? "Not favourite" : "Favourite"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
