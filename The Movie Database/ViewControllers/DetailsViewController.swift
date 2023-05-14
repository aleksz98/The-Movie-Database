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
    
    var movie: Results?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
    }
    
    private func loadInfo() {
        var imageUrlString = ""
        if let backdropPath = self.movie?.backdropPath{
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
            self.movieImage.sd_setImage(with: imageURL, completed: nil)
        }
        movieTitle.text = movie?.originalTitle ?? "No name"
        movieDescription.text = "Описание: \(movie?.overview ?? "No overview")"
        movieRating.text = "Рейтинг: \(movie?.voteAverage.description ?? "No rating")"
        movieVoteCount.text = "Количество голосов: \(movie?.voteCount.description ?? "No vote count")"
        movieReleaseDate.text = "Дата выхода: \(movie?.releaseDate ?? "No release date")"
    }
}
