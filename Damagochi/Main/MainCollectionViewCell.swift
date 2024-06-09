//
//  MainCollectionViewCell.swift
//  Damagochi
//
//  Created by 강석호 on 6/7/24.
//

import Foundation
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let titleView = UIView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        
        titleView.backgroundColor = UIColors.mainBackgroundColor
        titleView.layer.cornerRadius = 5
        titleView.layer.borderColor = UIColor.black.cgColor
        titleView.layer.borderWidth = 1
        
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = UIColors.mainFontColor
    }
    
    func configureLayout() {
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView.snp.height).multipliedBy(0.8)
        }
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.leading).offset(-8)
            make.trailing.equalTo(titleLabel.snp.trailing).offset(8)
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(titleView).inset(UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8))
        }
    }
}
