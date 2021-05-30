//
//  DetailViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/30.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    private var imageUrl: String = ""
    private var productId: String = ""
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        scrollView.contentSize = CGSize.init(width: 0, height: 900)
        return scrollView
    }()
    
    lazy var headerView: DetailHeaderView = {
        let headerView = DetailHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 284))
        return headerView
    }()
    
    lazy var describeView: DetailDescribeView = {
        let describeView = DetailDescribeView.init(frame: CGRect.init(x: 0, y: 284, width: screenWidth, height: 320))
        return describeView
    }()
    
    lazy var likeView: HomeLikeView = {
        let likeView = HomeLikeView.init(frame: CGRect.init(x: 0, y: 604, width: screenWidth, height: 220))
        return likeView
    }()
    
    init(withId pId: String, image img: String) {
        super.init(nibName: nil, bundle: nil)
        productId = pId
        imageUrl = img
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //<#code#>
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white

        self.headerView.imageView.kf.setImage(with: URL(string: self.imageUrl))
        self.view.addSubview(scrollView)
        
        headerView.closeButtonBlock = {
            [weak self] in self?.dismiss(animated: true) {}
        }
        scrollView.addSubview(headerView)

        scrollView.addSubview(describeView)
        
        likeView.titleLabel.text = "More from Wrangler"
        scrollView.addSubview(likeView)

    }

}
