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
    
    @IBOutlet weak var toDoBgView: UIView!
    @IBOutlet weak var toDoTextView: UITextView!
    
    @IBOutlet weak var updateButton: UIButton!
    
    lazy var buttons: [UIButton] = {
        return [redButton, greenButton, blueButton, yellowButton]
    }()
    
    var tempColor: Int64? = 1
    
    let toDoManager = CoreDataManager.shared
    
    var memoData: MemoData? {
        didSet {
            tempColor = memoData?.color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 모든 버튼에 설정 변경
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    func setup() {
        toDoTextView.delegate = self
        
        toDoBgView.clipsToBounds = true
        toDoBgView.layer.cornerRadius = 10
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 8
        clearButtonColors()
    }
    
    func configureUI() {
        // 기존데이터가 있을때
        if let memoData = self.memoData {
            self.title = "메모 수정하기"
            
            guard let text = memoData.memoText else { return }
            toDoTextView.text = text
            
            toDoTextView.textColor = .black
            updateButton.setTitle("UPDATE", for: .normal)
            toDoTextView.becomeFirstResponder()
            let color = MyColor(rawValue: memoData.color)
            setupColorTheme(color: color)
            
        // 기존데이터가 없을때
        } else {
            self.title = "새로운 메모 생성하기"
            
            toDoTextView.text = "텍스트를 여기에 입력하세요."
            toDoTextView.textColor = .lightGray
            setupColorTheme(color: .red)
        }
        setupColorButtonTapped(color: tempColor ?? 1)
    }
    
    @IBAction func tapColorButton(_ sender: UIButton) {
        tempColor = Int64(sender.tag)
        
        let color = MyColor(rawValue: Int64(sender.tag))
        setupColorTheme(color: color)
        
        clearButtonColors()
        setupColorButtonTapped(color: Int64(sender.tag))
    }
    
    func setupColorTheme(color: MyColor? = .red) {
        toDoBgView.backgroundColor = color?.backgoundColor
        updateButton.backgroundColor = color?.buttonColor
    }
    
    func clearButtonColors() {
        redButton.backgroundColor = MyColor.red.backgoundColor
        redButton.setTitleColor(MyColor.red.buttonColor, for: .normal)
        greenButton.backgroundColor = MyColor.green.backgoundColor
        greenButton.setTitleColor(MyColor.green.buttonColor, for: .normal)
        blueButton.backgroundColor = MyColor.blue.backgoundColor
        blueButton.setTitleColor(MyColor.blue.buttonColor, for: .normal)
        yellowButton.backgroundColor = MyColor.yellow.backgoundColor
        yellowButton.setTitleColor(MyColor.yellow.buttonColor, for: .normal)
    }
    
    //컬러버튼 눌렀을때 색상 설정
    func setupColorButtonTapped(color: Int64) {
        switch color {
        case 1:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        case 2:
            greenButton.backgroundColor = MyColor.green.buttonColor
            greenButton.setTitleColor(.white, for: .normal)
        case 3:
            blueButton.backgroundColor = MyColor.blue.buttonColor
            blueButton.setTitleColor(.white, for: .normal)
        case 4:
            yellowButton.backgroundColor = MyColor.yellow.buttonColor
            yellowButton.setTitleColor(.white, for: .normal)
        default:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        //nil 체크(기존 데이터 존재 여부)
        if let memoData = memoData {
            memoData.memoText = toDoTextView.text
            memoData.color = tempColor ?? 1
            toDoManager.updateToDo(newToDoData: memoData) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    // 다른 곳을 터치하면 키보드 포커스 해제
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

//텍스트뷰 플레이스 홀더용
extension DetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "텍스트를 여기에 입력하세요." {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "텍스트를 여기에 입력하세요."
            textView.textColor = .lightGray
        }
    }
}
