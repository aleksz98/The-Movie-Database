//
//  ViewController.swift
//  The Movie Database_Lesson 3.2
//
//  Created by Иван on 07.05.2023.
//

import UIKit

final class MoviesViewController: UIViewController {
    // MARK: - Private properties
    private let linkUrl = "https://api.themoviedb.org/3/trending/movie/week?api_key=99709c91f79d11764afb7ab67218f012"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourse()
    }
    
    // MARK: - Private methods
    private func fetchCourse() {
        
        guard let url = URL(string: linkUrl) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(Movies.self, from: data)
                print(movies)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

