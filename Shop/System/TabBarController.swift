//
//  TabBarController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/14.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        
        // Home
        let homeVC = HomeViewController()
        addChildViewController(homeVC,
                               image: UIImage(named: "tabbar_home"),
                               selectedImage: UIImage(named: "tabbar_home_sel"))
        
        // Category
        let categoryVC = CategoryViewController()
        addChildViewController(categoryVC,
                               image: UIImage(named: "tabbar_like"),
                               selectedImage: UIImage(named: "tabbar_like_sel"))
        
        // Cart
        let cartVC = CartViewController()
        addChildViewController(cartVC,
                               image: UIImage(named: "tabbar_cart"),
                               selectedImage: UIImage(named: "tabbar_cart_sel"))
        
        // Search
        let searchVC = UMineViewController()
        addChildViewController(searchVC,
                               image: UIImage(named: "tabbar_my"),
                               selectedImage: UIImage(named: "tabbar_my_sel"))
        
        let tabBar = CustomTabView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        self.setValue(tabBar, forKey: "tabBar")
    }
    

    func addChildViewController(_ childController: UIViewController, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(childController)
    }

}
