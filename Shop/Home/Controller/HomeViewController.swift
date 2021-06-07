//
//  HomeViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/14.
//

import UIKit

class HomeViewController: BaseViewController {
    
    static let search_y = 50
    static let search_height = 30
    
    static let scroll_y = search_y + search_height
    static let bannerHeight = 350
    
    static let likeView_Y = bannerHeight + 10
    static let likeViewHeight = 120
    
    static let contentLabelY = likeView_Y + likeViewHeight + 20
    static let contentLabelHeight = 20
    
    static let contentViewY = contentLabelY + contentLabelHeight + 10
    static let contentViewHeight = 500
    
    static let header_Height = 50
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField.init(frame: CGRect.init(x: 20, y: HomeViewController.search_y, width: Int(UIScreen.main.bounds.width) - 40, height: HomeViewController.search_height))
        textField.placeholder = " なにを探しですか？"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.layer.cornerRadius = 4
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.hex(hexString: "0xF4F4F4")
        return textField
    }()
    
    lazy var bannerView: HomeBannerView = {
        //let bannerView = HomeBannerView.init(frame: CGRect.zero)
        let bannerView = HomeBannerView.init(frame: CGRect.init(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: HomeViewController.bannerHeight))
        return bannerView
    }()
    
    lazy var likeView: HomeLikeView = {
        let likeView = HomeLikeView.init(frame: CGRect.init(x: 0, y: HomeViewController.likeView_Y, width: Int(UIScreen.main.bounds.width), height: HomeViewController.likeViewHeight))
        return likeView
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 20, y: HomeViewController.contentLabelY, width: Int(UIScreen.main.bounds.width), height: HomeViewController.contentLabelHeight))
        label.text = "人気商品ランキング"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
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
        
        let scrollView = UIScrollView(frame: CGRect.init(x: 0, y: CGFloat(HomeViewController.scroll_y),
                                                         width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
   
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + CGFloat(HomeViewController.contentViewHeight))
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(bannerView)

        scrollView.addSubview(likeView)
        
        scrollView.addSubview(contentLabel)

        let tableVC = HomeTableViewController()
        self.addChild(tableVC)

        let tView = UIView(frame: CGRect.init(x: 0, y: HomeViewController.contentViewY, width: Int(UIScreen.main.bounds.width), height: HomeViewController.contentViewHeight))
        tView.addSubview(tableVC.view)
        
        
        scrollView.addSubview(tView)
        tView.layer.shadowRadius = 5
    }

}

