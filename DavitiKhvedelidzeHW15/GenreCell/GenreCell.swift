//
//  GenreCell.swift
//  DavitiKhvedelidzeHW15
//
//  Created by Dato Khvedelidze on 14.07.22.
//

import UIKit

class GenreCell: UICollectionViewCell {

    @IBOutlet weak var genreLbl: UILabel!

    
    var movieGenre: Movie! {
        didSet {
            genreLbl.text = movieGenre.genre.rawValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
