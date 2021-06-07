//
//  CartDiscountView.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/18.
//

import UIKit

class CartDiscountView: UIView {

//    lazy var bgImageView: UIView = {
//        let bgView = UIView.init(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width - 20, height: 100))
//        bgView.backgroundColor = UIColor.hex(hexString: "#E3F2FD")
//        bgView.layer.cornerRadius = 10
//        return bgView
//    }()
    
    lazy var gotoPayButton: UIButton = {
        let bt = UIButton.init(frame: .zero)
        bt.backgroundColor = UIColor.hex(hexString: "#FFCC80")
        bt.setTitle("レジに進む(¥6，000)（税込）", for: UIControl.State.normal)
        bt.setTitleColor(UIColor.hex(hexString: "#E65100"), for: UIControl.State.normal)
        bt.setBackgroundColor(color: UIColor.hex(hexString: "#FFA726"), forState: UIControl.State.highlighted)
        bt.layer.cornerRadius = 10
        return bt
    }()
    
    lazy var discountImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "cart_gift"))
        return imageView
    }()
    
    lazy var discountLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "-10%"
        label.textColor = UIColor.hex(hexString: "0x2F69F8")
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var describeLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "合計：￥６０００（税込）"
        label.textColor = UIColor.black

        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var giftLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "give a gift"
        label.textColor = UIColor.hex(hexString: "0x2F69F8")
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(gotoPayButton)
        gotoPayButton.snp.makeConstraints {
            $0.left.top.equalTo(self)
            $0.width.equalTo(screenWidth - 40)
            $0.height.equalTo(50)
        }

//        self.addSubview(describeLabel)
//        describeLabel.snp.makeConstraints {
//            $0.bottom.equalToSuperview()
//        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
