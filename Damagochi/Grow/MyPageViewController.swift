//
//  MyPageViewController.swift
//  Damagochi
//
//  Created by 강석호 on 6/9/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    let tableView = UITableView()
    let cellTitles = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    let cellImages = ["pencil", "moon.fill", "arrow.2.circlepath"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정"
        
        configureHierarchy()
        configureUI()
        configureLayout()
    }
    
    func configureHierarchy() {
        
        view.addSubview(tableView)
    }
    
    func configureUI() {
        
        view.backgroundColor = UIColors.mainBackgroundColor
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 66
    }
    
    func configureLayout() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = cellTitles[indexPath.row]
        cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        cell.imageView?.image = UIImage(systemName: cellImages[indexPath.row])
        cell.imageView?.tintColor = .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let nameSettingVC = NameSettingViewController()
            navigationController?.pushViewController(nameSettingVC, animated: true)
        case 1:
            let changeDamagochiVC = ChangeDamagochiViewController()
            navigationController?.pushViewController(changeDamagochiVC, animated: true)
        case 2:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말로 데이터를 초기화하시겠습니까?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "초기화", style: .destructive, handler: { _ in
                // 데이터 초기화 코드
                print("데이터가 초기화되었습니다.")
            }))
            present(alert, animated: true, completion: nil)
        default:
            break
        }
    }
    
}
