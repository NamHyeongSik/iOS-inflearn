//
//  ChatCell.swift
//  Chat_App
//
//  Created by HYEONG SIK NAM on 2022/04/26.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var myTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
