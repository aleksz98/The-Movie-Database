//
//  ViewController.swift
//  The Movie Database_Lesson 3.2
//
//  Created by Иван on 07.05.2023.
//

import UIKit

final class MoviesViewController: UIViewController {
    // MARK: - Private IBOutlets
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // MARK: - Private properties
    private var movies: Movies?
    private let networkManager = NetworkManager.shared
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesCollectionView.register(UINib(nibName: "MoviesViewCell", bundle: nil), forCellWithReuseIdentifier: "MoviesViewCell")
        fetchMovies()
    }
}

extension MoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let moviesCell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MoviesViewCell", for: indexPath) as! MoviesViewCell
        moviesCell.awakeFromNib()
        return moviesCell
    }
    
    
}
    //MARK: - Networking
extension MoviesViewController {
    private func fetchMovies() {
        networkManager.fetchMovies(Movies.self, from: Link.moviesUrl.url) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
            case .failure(let error):
                print(error)
            }
        }
    }
}

