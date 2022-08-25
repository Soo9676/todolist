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
    @IBOutlet weak var updateBtn: UIButton!
    
    // ToDoData를 전달받을 변수 (전달 받으면 ==> 표시하는 메서드 실행) ⭐️
    var MemoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    // (델리게이트 대신에) 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 (셀(자신)을 전달)
    var updateButtonPressed: (ToDoCell) -> Void = { (sender) in }
    
    
    // 기본 UI
    func configureUI() {
        toDoView.clipsToBounds = true
        toDoView.layer.cornerRadius = 8

        updateBtn.clipsToBounds = true
        updateBtn.layer.cornerRadius = 10
    }
    
    // 데이터를 가지고 적절한 UI 표시하기
    func configureUIwithData() {
        toDoTextLabel.text = MemoData?.memoText
        toDoDateLabel.text = MemoData?.dateString
        guard let colorNum = MemoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateBtn.backgroundColor = color.buttonColor
        toDoView.backgroundColor = color.backgoundColor
    }
    
    @IBAction func updateBtnTapped(_ sender: UIButton) {
        updateButtonPressed(self)
    }

}
