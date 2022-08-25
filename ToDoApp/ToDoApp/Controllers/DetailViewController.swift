//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by Soo J on 2022/08/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var colorButtonStack: UIStackView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    @IBOutlet weak var toDoTextView: UITextView!
    
    @IBOutlet weak var updateButton: UIButton!
    
    lazy var buttons: [UIButton] = {
        return [redButton, greenButton, blueButton, yellowButton]
    }()
    
    let toDoManager = CoreDataManager.shared
    
    
    
    
}
