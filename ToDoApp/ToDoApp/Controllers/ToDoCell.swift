//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by Soo J on 2022/08/24.
//

import UIKit

class ToDoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var toDoView: UIView!
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var toDoDateLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    

}
