//
//  DamagochiData.swift
//  Damagochi
//
//  Created by 강석호 on 6/7/24.
//

import Foundation
import UIKit

import UIKit

class DamagochiData {
    static let ttakkeum = DamagochiData(title: "따끔따끔 다마고치",
                                        description: "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g이에요. 성격은 소심하지만 마음은 따뜻해요. 먹이만 제대로 준다면 성장은 잘합니다.",
                                        image: UIImage(named: "1-6"),
                                        stats: ["lv": 1, "rice": 3, "water": 5])
    
    static let bangsil = DamagochiData(title: "방실방실 다마고치",
                                       description: "저는 방실방실 다마고치입니다. 키는 1cm 몸무게는 130g이에요. 성격은 소심하고 속도 좁아요. 먹이만 제대로 준다면 성장은 잘합니다.",
                                       image: UIImage(named: "2-6"),
                                       stats: ["lv": 1, "rice": 2, "water": 4])
    
    static let banjjack = DamagochiData(title: "반짝반짝 다마고치",
                                        description: "저는 반짝반짝 다마고치입니다. 키는 3cm 몸무게는 200g이에요. 딴건 모르겠고 성장하면 엄청 밝아집니다. 믿어주세요",
                                        image: UIImage(named: "3-6"),
                                        stats: ["lv": 1, "rice": 4, "water": 6])
    
    static let placeholder = DamagochiData(title: "준비중입니다",
                                           description: "해당 다마고치는 준비중입니다.",
                                           image: UIImage(named: "noImage"),
                                           stats: ["lv": 0, "rice": 0, "water": 0])
    
    let title: String
    let description: String
    let image: UIImage?
    var stats: [String: Int]
    
    init(title: String, description: String, image: UIImage?, stats: [String: Int]) {
        self.title = title
        self.description = description
        self.image = image
        self.stats = stats
    }
}
