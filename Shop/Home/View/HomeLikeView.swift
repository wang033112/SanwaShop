//
//  HomeLikeView.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/22.
//

import UIKit

class HomeLikeView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "おすすめ商品"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 130 , height: 90)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = CGSize.init(width: 20, height: 160)
        layout.footerReferenceSize = CGSize.init(width: 20, height: 160)
        let collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 30, width: screenWidth, height: 90), collectionViewLayout: layout)
        collectView.backgroundColor = .white
        collectView.delegate = self
        collectView.dataSource = self
        collectView.showsVerticalScrollIndicator = false
        collectView.showsHorizontalScrollIndicator = false
        collectView.register(HomeLikeItemCell.classForCoder(), forCellWithReuseIdentifier: "HomeLikeItemCell")
        return collectView
    }()
    
    lazy var likeData: Array<HomeLikeModel> = {
        let data = HomeLikeModel.defaultData()
        return data
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top)
        }
        
        self.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeLikeView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeLikeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        likeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellString = "HomeLikeItemCell"
        let cell: HomeLikeItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellString, for: indexPath) as! HomeLikeItemCell
        let data: HomeLikeModel = likeData[indexPath.row]
        cell.imageView.image = UIImage.init(named: data.pdImage!)
        cell.nameLabel.text = data.pdName
        cell.brandLabel.text = data.pdBrand
        cell.likeButton.isSelected = data.isLike
        return cell
    }
    
}

class HomeLikeItemCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Jacket in blue denim"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Wrangler"
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var likeButton: LFFPraiseButton = {
        let image = UIImage.init(named: "home_like_button")
        let button = LFFPraiseButton(frame: CGRect(x: 90, y: 5, width: 36, height: 32), image: image)
        button.imageColorOn = .red
        button.circleColor = .red
        button.imageColorOff = .white
        button.lineColor = .red
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.left.top.right.equalTo(self)
            $0.height.equalTo(160)
        }
        
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.left)
            $0.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        self.contentView.addSubview(brandLabel)
        brandLabel.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.left)
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
        }
        
        self.contentView.addSubview(likeButton)
        likeButton.addTarget(self, action: #selector(likeButtonClick), for: .touchUpInside)

    }
    
    @objc func likeButtonClick(sender: LFFPraiseButton) {
        if sender.isSelected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

