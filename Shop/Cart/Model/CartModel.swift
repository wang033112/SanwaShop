//
//  CartModel.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/21.
//

import Foundation

struct CartModel {
    // 产品图片
    var pdImage: String?
    // 产品名
    var pdName: String?
    // 产品品牌
    var pdBrand: String?
    // 产品大小
    var pdSize: String?
    // 产品颜色
    var pdColor: String?
    // 产品数量
    var pdQuantity: String?
    // 产品价格
    var pdPrice: String?
    
    init(pdImage: String,
         pdName: String,
         pdBrand: String,
         pdSize: String,
         pdColor: String,
         pdQuantity: String,
         pdPrice: String) {
        self.pdImage = pdImage
        self.pdName = pdName
        self.pdBrand = pdBrand
        self.pdSize = pdSize
        self.pdColor = pdColor
        self.pdQuantity = pdQuantity
        self.pdPrice = pdPrice
    }
    
    static func defaultData() -> Array<CartModel> {
        let product_1 = CartModel.init(pdImage: "product_img",
                                          pdName: "Jacket in blue denim",
                                          pdBrand: "Wrangler",
                                          pdSize: "S",
                                          pdColor: "0xECB900",
                                          pdQuantity: "1",
                                          pdPrice: "230")
        
        let product_2 = CartModel.init(pdImage: "product_img",
                                          pdName: "T-shirt Mark Lebon Julie",
                                          pdBrand: "Prada",
                                          pdSize: "S",
                                          pdColor: "0xEE711D",
                                          pdQuantity: "1",
                                          pdPrice: "50")
        
        let product_3 = CartModel.init(pdImage: "product_img",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")
        
        let product_4 = CartModel.init(pdImage: "product_img",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")
        
        let product_5 = CartModel.init(pdImage: "product_img",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")
        
        let product_6 = CartModel.init(pdImage: "product_img",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")
        
        let product_7 = CartModel.init(pdImage: "product_img",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")
        
        let product_8 = CartModel.init(pdImage: "product_img",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")

        return [product_1, product_2, product_3, product_4, product_5, product_6, product_7, product_8]
    }
    
}
