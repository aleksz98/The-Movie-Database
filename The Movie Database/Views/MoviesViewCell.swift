//
//  MoviesViewCell.swift
//  The Movie Database
//
//  Created by Иван on 10.05.2023.
//

import UIKit
import SDWebImage

class MoviesViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlets
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    // MARK: - Private methods
    func configureWithMovies(_ item: ResultsMovies) {
        movieTitle.text = item.originalTitle
        var imageUrlString = ""
        if let backdropPath = item.backdropPath {
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
            movieImage.sd_setImage(with: imageURL, completed: nil)
        }
    }
    
    func configureWithSerials(_ item: ResultsSerials) {
        movieTitle.text = item.originalName
        var imageUrlString = ""
        if let backdropPath = item.backdropPath {
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
            movieImage.sd_setImage(with: imageURL, completed: nil)
        }
    }
}
