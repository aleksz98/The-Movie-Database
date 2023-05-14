//
//  DetailsViewController.swift
//  The Movie Database
//
//  Created by Иван on 14.05.2023.
//

import UIKit
import SDWebImage

final class DetailsViewController: UIViewController {
    // MARK: - Private IBOutlets
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieDescription: UILabel!
    @IBOutlet private weak var movieVoteCount: UILabel!
    @IBOutlet private weak var movieRating: UILabel!
    @IBOutlet private weak var movieReleaseDate: UILabel!
    
    // MARK: - Properties
    var movie: ResultsMovies?
    var serial: ResultsSerials?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
    }
    
    // Mark: - Private methods
    private func loadInfo() {
        var imageUrlString = ""
        
        if let backdropPath = movie?.backdropPath ?? serial?.backdropPath {
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            if let imageURL = URL(string: imageUrlString) {
                movieImage.sd_setImage(with: imageURL, completed: nil)
            }
        }
        
        let title = movie?.originalTitle ?? serial?.originalName ?? "No name"
        let overview = movie?.overview ?? serial?.overview ?? "No overview"
        let voteAverage = movie?.voteAverage.description ?? serial?.voteAverage.description ?? "No rating"
        let voteCount = movie?.voteCount.description ?? serial?.voteCount.description ?? "No vote count"
        let releaseDate = movie?.releaseDate ?? serial?.firstAirDate ?? "No release date"
        
        movieTitle.text = title
        movieDescription.text = "Описание: \(overview)"
        movieRating.text = "Рейтинг: \(voteAverage)"
        movieVoteCount.text = "Количество голосов: \(voteCount)"
        movieReleaseDate.text = "Дата выхода: \(releaseDate)"
    }
}
