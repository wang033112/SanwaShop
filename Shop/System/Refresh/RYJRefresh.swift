//
//  Refresh.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/21.
//

import UIKit
import MJRefresh

extension UIScrollView {
    var ryjHead: MJRefreshHeader {
        get { return mj_header! }
        set { mj_header = newValue }
    }
    
    var ryjFoot: MJRefreshFooter {
        get { return mj_footer! }
        set { mj_footer = newValue }
    }
}

class RefreshNormalHeader: MJRefreshNormalHeader {}
