//
//  SanwaAPI.swift
//  Shop
//
//  Created by Wang Jie on 2021/05/08.
//

import Foundation
import Moya


// 初始化请求的provider
let SanwaShopProvider = MoyaProvider<SanwaAPI>()

// 请求分类
enum SanwaAPI {
    case homePage    // 首页
}


// 请求配置
extension SanwaAPI: TargetType {
    
    public var task: Task {
        switch self {
        case .homePage :
            return .requestPlain
        }
    }

    
    public var baseURL: URL {
        return URL(string: "https://1c1q84ez36.execute-api.ap-northeast-1.amazonaws.com/Dev")!
    }
    
    public var path: String {
        switch self {
        case .homePage:
            return "/homepage"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .homePage:
            return .get
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
        
//
//    public var task: Task {
//        switch self {
//        case .homePage :
//            return .requestPlain
//        default:
//            return.requestPlain
//        }
//    }
    
    
    var headers: [String : String]? {
        return nil
    }
}
