//
//  LikeViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/15.
//

import UIKit

class LikeViewController: BaseViewController {

    var weatherData: weather? = nil
    var lifeData: life? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "Like"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        getWeatherData()
        getLifeData()
    }
    
    func getWeatherData() {
        ShopProvider.request(.weather) { [self] result in
            if case let .success(response) = result {
                // 解析数据
                let jsonString = String(data: response.data, encoding: .utf8)
                weatherData = weather.deserialize(from: jsonString, designatedPath: "result")
            }
        }
    }
    
    func getLifeData() {
        ShopProvider.request(.life) { [self] result in
            if case let .success(response) = result {
                // 解析数据
                let jsonString = String(data: response.data, encoding: .utf8)
                lifeData = life.deserialize(from: jsonString, designatedPath: "result.life")
            }
        }
    }
}
