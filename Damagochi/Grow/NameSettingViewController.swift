//
//  NameSettingViewController.swift
//  Damagochi
//
//  Created by 강석호 on 6/9/24.
//

import UIKit

class NameSettingViewController: UIViewController {
    
    let textField = UITextField()
    let textFieldLine = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        configureHierarchy()
        configureUI()
        configureLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func configureHierarchy() {
        view.addSubview(textField)
        view.addSubview(textFieldLine)
    }
    
    func configureUI() {
        view.backgroundColor = UIColors.mainBackgroundColor
        
        textField.borderStyle = .none
        textField.placeholder = "이름을 입력하세요"
        
        textFieldLine.backgroundColor = .darkGray
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalTo(view).inset(20)
            make.height.equalTo(40)
        }
        
        textFieldLine.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom)
            make.leading.trailing.equalTo(textField)
            make.height.equalTo(1)
        }
    }
    
    @objc func saveButtonTapped() {
        guard let nickname = textField.text, !nickname.isEmpty else {
            let alert = UIAlertController(title: "경고", message: "이름을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        UserDefaults.standard.set(nickname, forKey: "nickname")
        
        let alert = UIAlertController(title: nil, message: "저장되었습니다", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
