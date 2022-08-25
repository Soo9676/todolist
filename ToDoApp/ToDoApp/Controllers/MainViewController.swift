//
//  ViewController.swift
//  ToDoApp
//
//  Created by Soo J on 2022/08/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 모델(저장 데이터를 관리하는 코어데이터)
    let toDoManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
    }
    
    // 화면에 다시 진입할때마다 테이블뷰 리로드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    func setupNaviBar() {
        self.title = "메모"
        
        // 네비게이션바 우측에 Plus 버튼 만들기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }

    func setupTableView() {
        tableView.dataSource = self
        // 테이블뷰의 선 없애기
        tableView.separatorStyle = .none
    }
    
    @objc func plusButtonTapped() {
        performSegue(withIdentifier: "goToDetail", sender: nil)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoManager.getToDoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        // 셀에 모델(ToDoData) 전달
        let MemoData = toDoManager.getToDoListFromCoreData()
        cell.MemoData = MemoData[indexPath.row]
        
        // 셀위에 있는 버튼이 눌렸을때 (뷰컨트롤러에서) 어떤 행동을 하기 위해서 클로저 전달
        cell.updateButtonPressed = { [weak self] (senderCell) in
            // 뷰컨트롤러에 있는 세그웨이의 실행
            self?.performSegue(withIdentifier: "goToDetail", sender: indexPath)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
}



