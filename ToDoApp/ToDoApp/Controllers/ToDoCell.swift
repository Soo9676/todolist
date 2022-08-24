//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by Soo J on 2022/08/24.
//

import UIKit

protocol UpdateButtonProtocol: AnyObject {
    func updateButtonTapped(cell: ToDoCell)
}

class ToDoCell: UICollectionViewCell {
    
    @IBAction func updateButton(_ sender: Any) {
    }
}
