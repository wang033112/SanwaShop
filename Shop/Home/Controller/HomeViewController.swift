//
//  HomeViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/14.
//

import UIKit

class HomeViewController: BaseViewController {
    
    lazy var bannerView: HomeBannerView = {
        let bannerView = HomeBannerView.init(frame: CGRect.zero)
        return bannerView
    }()
    
    lazy var likeView: HomeLikeView = {
        let likeView = HomeLikeView.init(frame: CGRect.zero)
        return likeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "New Collection"
        
        bannerView.didSelectBlock = {
            [weak self] in
            _ = $0.row
            let detailVC = DetailViewController.init()
            detailVC.modalPresentationStyle = .fullScreen
            self?.present(detailVC, animated: true, completion: {})
        }
        self.view.addSubview(bannerView)
        self.view.sendSubviewToBack(bannerView)
        bannerView.snp.makeConstraints {
            $0.left.top.right.equalTo(self.view)
            $0.height.equalTo(457)
        }
        
        self.view.addSubview(likeView)
        likeView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(self.bannerView.snp.bottom).offset(10)
            $0.height.equalTo(250)
        }
        
        
    }

}

