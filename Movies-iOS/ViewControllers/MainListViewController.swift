//
//  ViewController.swift
//  Movies-iOS
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class MainListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    // MARK: Properties
        
        var movies: [Movie] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            tableView.dataSource = self
            
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.delegate = self
            self.navigationItem.searchController = searchController
            
            searchMovies(query: "Harry")
        }
        
    // MARK: TableView dataSource
    
        func searchMovies(query: String) {
            Task {
                movies = await MovieProvider.findMoviesByName(query: query)
                tableView.reloadData()
            }
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchMovies(query: searchBar.text!)
        }
    
    // MARK: TableView dataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
            let movie = movies[indexPath.row]
            cell.render(movie: movie)
            return cell
        }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMovieDetail",
           let detailVC = segue.destination as? MovieDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            let selectedMovie = movies[indexPath.row]
            detailVC.movieId = selectedMovie.id  // PASAS SOLO EL ID
        }
    }
    
 }

