//
//  DetailViewController.swift
//  MovieApp
//
//  Created by HYEONG SIK NAM on 2022/04/06.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

    var movieResult: MovieResult?
    
    var player: AVPlayer?
    
    @IBOutlet weak var movieContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movieResult?.trackName
        descriptionLabel.text = movieResult?.longDescription
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let hasURL = movieResult?.previewUrl {
            makePlayer(urlString: hasURL)
        }
    }
    
    func makePlayer(urlString: String) {
        if let url = URL(string: urlString) {
            self.player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            self.player?.play()
        }
    }
    
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    
}
