//
//  HomeViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/14.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let search_y = 50
    let search_height = 30
    
    let scroll_y = 80
    let header_Height = 50
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField.init(frame: CGRect.init(x: 20, y: search_y, width: Int(UIScreen.main.bounds.width) - 40, height: search_height))
        textField.placeholder = " なにを探しですか？"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.layer.cornerRadius = 4
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.hex(hexString: "0xF4F4F4")
        return textField
    }()
    
    lazy var bannerView: HomeBannerView = {
        //let bannerView = HomeBannerView.init(frame: CGRect.zero)
        let bannerView = HomeBannerView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350))
        return bannerView
    }()
    
    lazy var likeView: HomeLikeView = {
        let likeView = HomeLikeView.init(frame: CGRect.init(x: 0, y: 360, width: UIScreen.main.bounds.width, height: 120))
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
        //super.viewDidLoad()
        self.view.addSubview(searchTextField)
        
        bannerView.didSelectBlock = {(id, img) in
            //let detailVC = DetailViewController.init()
            let detailVC = DetailViewController(withId: id, image: img)
            detailVC.modalPresentationStyle = .fullScreen
            self.present(detailVC, animated: true, completion: {})
        }
        
        let scrollView = UIScrollView(frame: CGRect.init(x: 0, y: CGFloat(scroll_y), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
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
        let tView = UIView(frame: CGRect.init(x: 0, y: 500, width: UIScreen.main.bounds.width, height: 600))
        tView.addSubview(tableVC.view)
//        tableVC.view.snp.makeConstraints{
//            $0.top.equalToSuperview().inset(10)
//        }
        //scroll.addSubview(tView)
//
        scrollView.addSubview(tView)
        tView.layer.shadowRadius = 5
        tView.backgroundColor = UIColor.init(code: "#E3F2FD")
        //tView.layer.borderColor = UIColor.init(code: "#E3F2FD").cgColor
        tView.layer.borderWidth = 2
        
//        tView.snp.makeConstraints{
//            $0.top.equalTo(likeView.snp.bottom)
//            $0.topMargin.equalTo(20)
//        }
        
        
    }

}

