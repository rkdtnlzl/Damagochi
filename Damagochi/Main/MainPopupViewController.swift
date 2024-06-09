//
//  MainPopupViewController.swift
//  Damagochi
//
//  Created by 강석호 on 6/7/24.
//

import Foundation
import UIKit

class MainPopupViewController: UIViewController {
    
    let containerView = UIView()
    let infoView = UIView()
    let imageView = UIImageView()
    let titleView = UIView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let cancelButton = UIButton(type: .system)
    let startButton = UIButton(type: .system)
    
    var image: UIImage?
    var titleText: String?
    var descriptionText: String?
    
    var damagochiCase: DamagochiData = .placeholder
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configureAction()
    }
    
    func configureHierarchy() {
        
        view.addSubview(containerView)
        containerView.addSubview(infoView)
        infoView.addSubview(imageView)
        infoView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        infoView.addSubview(descriptionLabel)
        infoView.addSubview(cancelButton)
        infoView.addSubview(startButton)
    }
    
    func configureAction() {
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    func configureUI() {
        
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 1
        
        infoView.layer.cornerRadius = 25
        infoView.clipsToBounds = true
        infoView.backgroundColor = UIColors.mainBackgroundColor
        
        imageView.backgroundColor = .clear
        imageView.image = image
        
        titleView.backgroundColor = UIColors.mainBackgroundColor
        titleView.layer.cornerRadius = 5
        titleView.layer.borderColor = UIColor.black.cgColor
        titleView.layer.borderWidth = 1
        
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = UIColors.mainFontColor
        titleLabel.text = titleText
        
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .black
        descriptionLabel.text = descriptionText
        descriptionLabel.numberOfLines = 0
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        cancelButton.setTitleColor(.black, for: .normal)
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        startButton.setTitleColor(.black, for: .normal)
    }
    
    func configureLayout() {
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
            make.width.equalTo(350)
            make.height.equalTo(400)
        }
        
        infoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.leading).offset(-8)
            make.trailing.equalTo(titleLabel.snp.trailing).offset(8)
            make.height.equalTo(titleLabel.snp.height).multipliedBy(1.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(titleView).inset(UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(60)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(40)
            make.width.equalTo(infoView.snp.width).multipliedBy(0.5)
        }
        
        startButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(40)
            make.width.equalTo(infoView.snp.width).multipliedBy(0.5)
        }
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func startButtonTapped() {
        
        let vc = GrowViewController()
        vc.damagochiCase = damagochiCase
        navigationController?.pushViewController(vc, animated: true)
    }
}
