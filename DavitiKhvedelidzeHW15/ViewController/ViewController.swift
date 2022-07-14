//
//  ViewController.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 12.07.22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    let movies = [
        Movie.movies.filter { $0.seen },
        Movie.movies.filter { !$0.seen }
    ]
    
    var difDataSource: UICollectionViewDiffableDataSource<Genre,Movie>!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureCollectionView()
    }
    
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureCollectionView() {
        genresCollectionView.delegate = self
        genresCollectionView.registerNib(class: GenreCell.self)
        genresCollectionView.isScrollEnabled = false
        
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumLineSpacing = 10
        customFlowLayout.scrollDirection = .horizontal
        genresCollectionView.collectionViewLayout = customFlowLayout
        
        createDifDatasource()
    }
    
    func createDifDatasource() {
        difDataSource = UICollectionViewDiffableDataSource(collectionView: genresCollectionView, cellProvider: { collectionView, indexPath, movie in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
            cell.movieGenre = self.movies[indexPath.section][indexPath.row]
            return cell
        })
    }

    
}

