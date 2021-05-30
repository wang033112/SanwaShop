//
//  DammyData.swift
//  Shop
//
//  Created by Wang Jie on 2021/05/30.
//

import Foundation

class DammyData {
        
    static func createProducts() -> [ProductModel] {

        let p1 = ProductModel(imageUrl: "Bryant", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p2 = ProductModel(imageUrl: "Celtic", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p3 = ProductModel(imageUrl: "James", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p4 = ProductModel(imageUrl: "Hill", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p5 = ProductModel(imageUrl: "Lakers", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p6 = ProductModel(imageUrl: "Curry", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")

        let products = [p1, p2, p3, p4, p5, p6]
        //let products = [p1]
        return products
    }
}
