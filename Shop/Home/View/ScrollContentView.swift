//
//  ScrollContentView.swift
//  Shop
//
//  Created by Wang Jie on 2021/05/30.
//

import Foundation
import UIKit

class ScrollContentView: UITableView {
    var syncScrollContext: ScrollContextInfo?
    override var contentOffset: CGPoint {
        didSet {
            if contentOffset.y != oldValue.y {
                guard let syncScrollContext = syncScrollContext else { return }
                if syncScrollContext.outerOffset.y < syncScrollContext.maxOffsetY {
                    contentOffset.y = -contentInset.top
                }
                syncScrollContext.innerOffset = contentOffset
            }
        }
    }
}

//extension ScrollContentView: TabSubScrollViewSyncable {
//    func syncContext() {
//        guard let syncScrollContext = syncScrollContext else { return }
//        if syncScrollContext.outerOffset.y < syncScrollContext.maxOffsetY {
//            contentOffset.y = 0 - contentInset.top
//        }
//        syncScrollContext.innerOffset = contentOffset
//    }
//}

extension ScrollContentView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.view is UICollectionView
        || otherGestureRecognizer.view is UICollectionView {
            return false
        }
        return true
    }
}

class ScrollContextInfo {
    var maxOffsetY: CGFloat = 0
    var outerOffset: CGPoint = CGPoint.zero
    var innerOffset: CGPoint = CGPoint.zero
}

class HomeContentViewCell: UITableViewCell {
    
    var icon: UIImageView
    var title: UILabel
    var labelA: PaddingLabel
    var labelB: PaddingLabel
    var total: PaddingLabel
    
    var item: ProductModel? {
        didSet {
            print("Item didset ")
            icon.image = UIImage(named: item?.imageUrl ?? "James")
            title.text = item?.name
            labelA.text = "NEW"
            labelB.text = "ON SALE"
            total.text = "¥3000(税込)"
        }
    }
    
    
    required  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        icon = UIImageView()
        title = UILabel()
        labelA = PaddingLabel()
        labelB = PaddingLabel()
        total = PaddingLabel()
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let view = UIView(frame: CGRect(x:0, y:0, width: 240, height: 150))
        view.backgroundColor = UIColor.init(code: "#4A6572")
        
        self.contentView.layer.shadowRadius = 5
        self.contentView.backgroundColor = UIColor.init(code: "#E64A19")
        self.contentView.addSubview(icon)
        icon.layer.cornerRadius = 5
        icon.layer.masksToBounds = true
        icon.snp.makeConstraints({ (make) in
            make.width.height.equalTo(80)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        })
        
        self.contentView.addSubview(title)
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = UIColor.black
        title.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
            make.height.equalTo(20)
        })
        
        self.contentView.addSubview(labelA)
        labelA.font = UIFont.systemFont(ofSize:8)
        labelA.textColor = UIColor.init(code: "#E64A19")
        labelA.backgroundColor = UIColor.init(code: "#FFAB91")
        labelA.layer.cornerRadius = 10
        labelA.layer.masksToBounds = true
        labelA.snp.makeConstraints({ (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
            make.height.equalTo(20)
        })
        
        self.contentView.addSubview(labelB)
        labelB.font = UIFont.systemFont(ofSize: 8)
        labelB.textColor = UIColor.init(code: "#00838F")
        labelB.backgroundColor = UIColor.init(code: "#80DEEA")
        labelB.layer.cornerRadius = 10
        labelB.layer.masksToBounds = true
        labelB.snp.makeConstraints({ (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(labelA.snp.right).offset(15)
            make.height.equalTo(20)
        })
        
        self.contentView.addSubview(total)
        total.font = UIFont.systemFont(ofSize: 12)
        total.textColor = UIColor.lightGray
        total.snp.makeConstraints({ (make) in
            make.top.equalTo(labelA.snp.bottom).offset(10)
            make.left.equalTo(icon.snp.right).offset(15)
            make.height.equalTo(20)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
