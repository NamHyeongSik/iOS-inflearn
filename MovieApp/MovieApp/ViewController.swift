//
//  ViewController.swift
//  MovieApp
//
//  Created by HYEONG SIK NAM on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {

    var movieModel: MovieModel?
    
    var term = ""
    
    var networkLayer = NetworkLayer()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.keyboardDismissMode = .onDrag
        requestMovieAPI()
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void ) {
        networkLayer.request(type: .justURL(urlString: urlString)) { data, response, error in
            if let hasData = data {
                DispatchQueue.main.async {
                    completion(UIImage(data: hasData))
                }
                return
            }
            completion(nil)
        }
    }
    
//    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void ) {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        if let hasUrl = URL(string: urlString) {
//            var request = URLRequest(url: hasUrl)
//            request.httpMethod = "GET"
//
//            session.dataTask(with: request) { data, response, error in
//                print( (response as! HTTPURLResponse).statusCode )
//                if let hasData = data {
//                    DispatchQueue.main.async {
//                        completion(UIImage(data: hasData))
//                    }
//                    return
//                }
//            }.resume()
//            session.finishTasksAndInvalidate()
//        }
//        completion(nil)
//    }
    
    //network
    func requestMovieAPI(){
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        let querys = [term, media]
        
        networkLayer.request(type: .searchMovie(querys: querys)) { data, response, error in
            if let hasData = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)

                    print(self.movieModel ?? "no data")

                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
    
//    func requestMovieAPI() {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        var components = URLComponents(string: "https://itunes.apple.com/search")
//
//        let term = URLQueryItem(name: "term", value: term)
//        let media = URLQueryItem(name: "media", value: "movie")
//
//        components?.queryItems = [term, media]
//
//        guard let url = components?.url else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request) { data, response, error in
//            print( (response as! HTTPURLResponse).statusCode )
//
//            if let hasData = data {
//                do {
//                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
//
//                    print(self.movieModel ?? "no data")
//
//                    DispatchQueue.main.async {
//                        self.movieTableView.reloadData()
//                    }
//                } catch {
//                    print(error)
//                }
//
//            }
//        }
//        task.resume()
//        session.finishTasksAndInvalidate()
//    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else {
            return
        }
        term = hasText
        requestMovieAPI()
        self.view.endEditing(true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        
//        detailVC.modalPresentationStyle = .fullScreen -> 꼭 close버튼 만들어줘야함
        self.present(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
        cell.priceLabel.text = currency + " " + price
        
        if let hasUrl = self.movieModel?.results[indexPath.row].image {
            self.loadImage(urlString: hasUrl) { image in
                cell.movieImageView.image = image
            }
        }
        
        
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
            let formatter = ISO8601DateFormatter() //"2019-03-08T08:00:00Z"
            if let isoDate = formatter.date(from: dateString) {
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy-MM-dd"
                
                let dateString = myFormatter.string(from: isoDate)
                cell.dateLabel.text = dateString
            }
        }
        
        
        return cell
    }
    
    
}
