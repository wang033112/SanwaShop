//
//  HomeViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/14.
//

import UIKit

class HomeViewController: BaseViewController {
    
    lazy var bannerView: HomeBannerView = {
        //let bannerView = HomeBannerView.init(frame: CGRect.zero)
        let bannerView = HomeBannerView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 457))
        return bannerView
    }()
    
    lazy var likeView: HomeLikeView = {
        let likeView = HomeLikeView.init(frame: CGRect.init(x: 0, y: 467, width: UIScreen.main.bounds.width, height: 250))
        return likeView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        SanwaShopProvider.request(.homePage) {(result) in
            switch result {
            case let .success(response):
                // 解析数据
                let jsonString = String(data: response.data, encoding: .utf8)
                if let home = [HomePage].deserialize(from: jsonString) {
                    self.bannerView.setHomePage(homePage: home)
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.titleLabel.text = "三和"
        
        bannerView.didSelectBlock = {(id, img) in
            //let detailVC = DetailViewController.init()
            let detailVC = DetailViewController(withId: id, image: img)
            detailVC.modalPresentationStyle = .fullScreen
            self.present(detailVC, animated: true, completion: {})
        }
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        //scroll.alwaysBounceVertical = true
//        scroll.alwaysBounceVertical = true
//        scroll.isPagingEnabled = true
//        scroll.backgroundColor = .brown
//        scroll.contentSize = CGSize.init(width: 0, height: 900)
//        scroll.isScrollEnabled = true
//        scroll.bounces = false
        //scroll.contentSize.height = 3000
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
//        scroll.snp.makeConstraints {
//            $0.left.right.top.equalTo(self.view)
//        }
        //scrollView.contentSize = CGSize.init(width: 0, height: 1500)
        //CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 600)
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(bannerView)
        
        //self.view.sendSubviewToBack(bannerView)
//        bannerView.snp.makeConstraints {
//            $0.left.top.right.equalTo(self.view)
//            $0.height.equalTo(457)
//        }
        
        scrollView.addSubview(likeView)
        //self.view.addSubview(likeView)
//        likeView.snp.makeConstraints {
//            $0.left.right.equalTo(self.view)
//            $0.top.equalTo(self.bannerView.snp.bottom).offset(10)
//            $0.height.equalTo(250)
//        }
//
        let tableVC = HomeTableViewController()
        self.addChild(tableVC)
//
        let tView = UIView(frame: CGRect.init(x: 0, y: 717, width: UIScreen.main.bounds.width, height: 600))
        tView.addSubview(tableVC.view)
        //scroll.addSubview(tView)
//
        scrollView.addSubview(tView)
//        tView.snp.makeConstraints{
//            $0.top.equalTo(likeView.snp.bottom)
//            $0.topMargin.equalTo(20)
//        }
        
        
    }

}

