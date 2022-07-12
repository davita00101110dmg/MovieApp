//
//  ViewController.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    let movies = [
        Movie.movies.filter { $0.seen },
        Movie.movies.filter { !$0.seen }
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func toggleMovie(cell: MovieCell) {
//        if let indexPath = table.indexPath(for: cell) {
//            var movie = movies[indexPath.section][indexPath.row]
//            movie.seen = movie.seen == true ? false : true
//            table.reloadData()
//        }
//    }
        
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Seen Movies"
        } else {
            return "Watchlist"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let movie = movies[indexPath.section][indexPath.row]
        detailsVC.movieTitle = movie.title
        detailsVC.movieRating = "Imdb rating \(movie.imdb)"
        detailsVC.movieReleaseDate = "Release Date \(movie.releaseDate)"
        detailsVC.movieMainActor = "Featuring \(movie.mainActor)"
        detailsVC.movieSeen = movie.seen ? "Seen ✅" : "Has not seen ❌"
        detailsVC.movieIsFavourite = movie.isFavourite ? "Favourite ❤️" : "Not favourite 💔"
        detailsVC.movieDesc = "Description: \(movie.description)"
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        cell.movieTitle.text = movie.title
        cell.movieRating.text = "\(movie.imdb)"
        
        return cell
    }
}
