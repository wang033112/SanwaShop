//
//  HomeModel.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/24.
//

import Foundation

struct HomeLikeModel {
    // 产品图片
    var pdImage: String?
    // 产品名
    var pdName: String?
    // 产品品牌
    var pdBrand: String?
    // 是否喜欢
    var isLike: Bool = false
    
    init(pdImage: String,
         pdName: String,
         pdBrand: String,
         isLike: Bool) {
        self.pdImage = pdImage
        self.pdName = pdName
        self.pdBrand = pdBrand
        self.isLike = isLike
    }
    
    static func defaultData() -> Array<HomeLikeModel> {
        let product_1 = HomeLikeModel.init(pdImage: "home_like_product_1",
                                          pdName: "Jacket in blue denim",
                                          pdBrand: "Wrangler",
                                          isLike: false)
        
        let product_2 = HomeLikeModel.init(pdImage: "home_like_product_2",
                                          pdName: "Vans denim jacket",
                                          pdBrand: "GUCCI",
                                          isLike: false)

        let product_3 = HomeLikeModel.init(pdImage: "home_like_product_1",
                                          pdName: "Jacket in blue denim",
                                          pdBrand: "Wrangler",
                                          isLike: false)
        
        let product_4 = HomeLikeModel.init(pdImage: "home_like_product_2",
                                          pdName: "Vans denim jacket",
                                          pdBrand: "GUCCI",
                                          isLike: false)
        return [product_1, product_2, product_3, product_4]
    }
    
}
