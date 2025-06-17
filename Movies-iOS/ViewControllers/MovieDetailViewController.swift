//
//  MovieDetailViewController.swift
//  Movies-iOS
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var plotText: UITextView!
    
    var movieId: String!  // solo el id de imdb
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           fetchMovieDetails(imdbID: movieId)
       }
       
       func fetchMovieDetails(imdbID: String) {
           let urlString = "https://www.omdbapi.com/?apikey=13b99058&i=\(imdbID)"
           
           guard let url = URL(string: urlString) else { return }
           
           URLSession.shared.dataTask(with: url) { data, response, error in
               if let data = data {
                   do {
                       let movie = try JSONDecoder().decode(Movie.self, from: data)
                       DispatchQueue.main.async {
                           self.updateUI(with: movie)
                       }
                   } catch {
                       print("Error decoding detail:", error)
                   }
               }
           }.resume()
       }
       
       func updateUI(with movie: Movie) {
           movieTitle.text = movie.title
           year.text = movie.year
           runtime.text = movie.runtime
           genre.text = movie.genre
           director.text = movie.director
           country.text = movie.country
           plotText.text = movie.plot 
           
           if let url = URL(string: movie.poster) {
               moviePoster.loadFrom(url: url)
           }
       }
   }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
  
