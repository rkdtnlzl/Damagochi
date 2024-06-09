//
//  ViewController.swift
//  Damagochi
//
//  Created by 강석호 on 6/7/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let damagochiData: [DamagochiData] = [
        .ttakkeum,
        .bangsil,
        .banjjack
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColors.mainBackgroundColor
        navigationItem.title = "다마고치 선택하기"
        
        configureNavigationBar()
        configureHierarchy()
        configureLayout()
        configureCollectionView()
    }
    
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColors.mainBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func configureCollectionView() {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 110, height: 130)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
        }
        
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        if indexPath.item < damagochiData.count {
            let data = damagochiData[indexPath.item]
            cell.imageView.image = data.image
            cell.titleLabel.text = data.title
        } else {
            cell.imageView.image = DamagochiData.placeholder.image
            cell.titleLabel.text = DamagochiData.placeholder.title
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
        let popupVC = MainPopupViewController()
        
        if indexPath.item < damagochiData.count {
            let data = damagochiData[indexPath.item]
            popupVC.image = data.image
            popupVC.titleText = data.title
            popupVC.descriptionText = data.description
            popupVC.damagochiCase = data
        } else {
            let placeholderData = DamagochiData.placeholder
            popupVC.image = placeholderData.image
            popupVC.titleText = placeholderData.title
            popupVC.descriptionText = placeholderData.description
            popupVC.damagochiCase = placeholderData
            popupVC.startButton.isEnabled = false
        }
        
        let navigationController = UINavigationController(rootViewController: popupVC)
        navigationController.modalPresentationStyle = .overCurrentContext
        present(navigationController, animated: true, completion: nil)
    }
}
