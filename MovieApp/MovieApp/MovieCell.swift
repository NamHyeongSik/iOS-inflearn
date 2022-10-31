//
//  MovieCell.swift
//  MovieApp
//
//  Created by HYEONG SIK NAM on 2022/04/06.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        }
    }
    
    @IBOutlet weak var movieImageView: UIImageView!
    
}
