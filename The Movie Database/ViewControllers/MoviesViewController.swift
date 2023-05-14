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
    private var moviesList: [Results] = []
    private var serialsList: [Results] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesCollectionView.register(UINib(nibName: "MoviesViewCell", bundle: nil), forCellWithReuseIdentifier: "MoviesViewCell")
        fetchMovies()
        fetchSerials()
    }
    
    // MARK: - Private IBAction
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            self.moviesCollectionView.reloadData()
        case 1:
            self.moviesCollectionView.reloadData()
        default:
            print("Error")
        }
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let moviesCell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MoviesViewCell", for: indexPath) as! MoviesViewCell
        moviesCell.configureWith(moviesList[indexPath.row])
        return moviesCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            detailsViewController.movie = movie
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

//MARK: - Networking
extension MoviesViewController {
    private func fetchMovies() {
        NetworkManager.shared.reguestTrendingMovies { [weak self] moviesList in
            self?.moviesList = moviesList
            self?.moviesCollectionView.reloadData()
        }
    }
    
    private func fetchSerials() {
        NetworkManager.shared.reguestTrendingSerials { [weak self] serialsList in
            self?.serialsList = serialsList
            self?.moviesCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: 170, height: 170)
        return cellSize
    }
}
