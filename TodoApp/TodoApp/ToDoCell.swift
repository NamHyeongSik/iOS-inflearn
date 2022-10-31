//
//  ToDoCell.swift
//  TodoApp
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
