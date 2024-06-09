//
//  GrowViewController.swift
//  Damagochi
//
//  Created by 강석호 on 6/7/24.
//

import UIKit

class GrowViewController: UIViewController {
    
    let speakImageView = UIImageView()
    let speakLabel = UILabel()
    let damagochiImage = UIImageView()
    let titleView = UIView()
    let titleLabel = UILabel()
    let statsLabel = UILabel()
    let riceTextField = UITextField()
    let riceTextFieldLine = UIView()
    let riceButton = UIButton()
    let waterTextField = UITextField()
    let waterTextFieldLine = UIView()
    let waterButton = UIButton()
    
    
    var damagochiCase: DamagochiData = .placeholder
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nickname = UserDefaults.standard.string(forKey: "nickname") ?? "석호"
        navigationItem.title = "\(nickname)님의 다마고치"
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        
        configureHierarchy()
        configureUI()
        configureLayout()
        updateUI()
        
        waterButton.addTarget(self, action: #selector(waterButtonTapped), for: .touchUpInside)
        riceButton.addTarget(self, action: #selector(riceButtonTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func riceButtonTapped() {
        if var rice = damagochiCase.stats["rice"] {
            let riceAmount = Int(riceTextField.text ?? "") ?? 1
            rice += max(riceAmount, 1)
            damagochiCase.stats["rice"] = rice
            updateUI()
        }
    }
    
    @objc func waterButtonTapped() {
        if var water = damagochiCase.stats["water"] {
            let waterAmount = Int(waterTextField.text ?? "") ?? 1
            water += max(waterAmount, 1)
            damagochiCase.stats["water"] = water
            updateUI()
        }
    }
    
    @objc func rightBarButtonTapped() {
        let mypageVC = MyPageViewController()
        navigationController?.pushViewController(mypageVC, animated: true)
    }
    
    func updateUI() {
        let level = calculateLevel()
        speakLabel.text = "대장님 과제 하셨어요?"
        damagochiImage.image = getImageForLevel(level: level)
        titleLabel.text = damagochiCase.title
        statsLabel.text = "LV\(level) · 밥알 \(damagochiCase.stats["rice"] ?? 0)개 · 물방울 \(damagochiCase.stats["water"] ?? 0)개"
    }
    
    func calculateLevel() -> Int {
        let rice = damagochiCase.stats["rice"] ?? 0
        let water = damagochiCase.stats["water"] ?? 0
        let value = (rice / 5) + (water / 2)
        switch value {
        case 0..<20:
            return 1
        case 20..<30:
            return 2
        case 30..<40:
            return 3
        case 40..<50:
            return 4
        case 50..<60:
            return 5
        case 60..<70:
            return 6
        case 70..<80:
            return 7
        case 80..<90:
            return 8
        default:
            return 9
        }
    }
    
    func getImageForLevel(level: Int) -> UIImage? {
        let title = damagochiCase.title
        switch title {
        case "따끔따끔 다마고치":
            return UIImage(named: "1-\(level)")
        case "방실방실 다마고치":
            return UIImage(named: "2-\(level)")
        case "반짝반짝 다마고치":
            return UIImage(named: "3-\(level)")
        case "준비중입니다":
            return UIImage(named: "noImage")
        default:
            return nil
        }
    }
    
    func configureHierarchy() {
        
        view.addSubview(speakImageView)
        speakImageView.addSubview(speakLabel)
        view.addSubview(damagochiImage)
        view.addSubview(titleView)
        view.addSubview(titleLabel)
        view.addSubview(statsLabel)
        view.addSubview(riceTextField)
        view.addSubview(riceTextFieldLine)
        view.addSubview(riceButton)
        view.addSubview(waterTextField)
        view.addSubview(waterTextFieldLine)
        view.addSubview(waterButton)
    }
    
    func configureUI() {
        
        view.backgroundColor = UIColors.mainBackgroundColor
        
        speakImageView.image = UIImage(named: "bubble")
        
        speakLabel.text = "대장님 과제 하셨어요?"
        speakLabel.textColor = .black
        speakLabel.font = .systemFont(ofSize: 15)
        
        damagochiImage.image = UIImage(named: "2-6")
        
        titleView.backgroundColor = UIColors.mainBackgroundColor
        titleView.layer.cornerRadius = 5
        titleView.layer.borderColor = UIColor.black.cgColor
        titleView.layer.borderWidth = 1
        
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = UIColors.mainFontColor
        titleLabel.text = "따끔따끔 다마고치"
        
        statsLabel.font = .systemFont(ofSize: 15)
        statsLabel.textColor = .black
        
        riceTextField.backgroundColor = .clear
        riceTextField.textColor = .black
        riceTextField.placeholder = "밥주세요"
        riceTextField.keyboardType = .numberPad
        
        riceTextFieldLine.backgroundColor = .black
        
        riceButton.setTitle("밥먹기", for: .normal)
        riceButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        riceButton.setTitleColor(.black, for: .normal)
        riceButton.contentHorizontalAlignment = .center
        riceButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        riceButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        riceButton.layer.cornerRadius = 10
        riceButton.layer.borderWidth = 1
        riceButton.layer.borderColor = UIColor.black.cgColor
        
        waterTextField.backgroundColor = .clear
        waterTextField.textColor = .black
        waterTextField.placeholder = "물주세요"
        waterTextField.keyboardType = .numberPad
        
        waterTextFieldLine.backgroundColor = .black
        
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterButton.setTitleColor(.black, for: .normal)
        waterButton.contentHorizontalAlignment = .center
        waterButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        waterButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        waterButton.layer.cornerRadius = 10
        waterButton.layer.borderWidth = 1
        waterButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureLayout() {
        
        speakImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalToSuperview()
        }
        
        speakLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(speakImageView.snp.top).inset(50)
        }
        
        damagochiImage.snp.makeConstraints { make in
            make.top.equalTo(speakImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(damagochiImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.leading).offset(-8)
            make.trailing.equalTo(titleLabel.snp.trailing).offset(8)
            make.height.equalTo(titleLabel.snp.height).multipliedBy(1.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(titleView).inset(UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        }
        
        statsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        riceTextField.snp.makeConstraints { make in
            make.top.equalTo(statsLabel.snp.bottom).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.width.equalTo(100)
            make.height.equalTo(44)
        }
        
        riceTextFieldLine.snp.makeConstraints { make in
            make.top.equalTo(riceTextField.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.width.equalTo(riceTextField.snp.width)
            make.height.equalTo(1)
        }
        
        riceButton.snp.makeConstraints { make in
            make.top.equalTo(statsLabel.snp.bottom).offset(50)
            make.leading.equalTo(riceTextField.snp.trailing).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(44)
        }
        
        waterTextField.snp.makeConstraints { make in
            make.top.equalTo(riceButton.snp.bottom).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.width.equalTo(100)
            make.height.equalTo(44)
        }
        
        waterTextFieldLine.snp.makeConstraints { make in
            make.top.equalTo(waterTextField.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.width.equalTo(waterTextField.snp.width)
            make.height.equalTo(1)
        }
        
        waterButton.snp.makeConstraints { make in
            make.top.equalTo(riceButton.snp.bottom).offset(50)
            make.leading.equalTo(waterTextField.snp.trailing).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(44)
        }
    }
    
}
