//
//  NetworkTools.swift
//  Alamofire的测试
//
//  Created by 1 on 16/9/19.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        AF.request(URLString, method: method, parameters:parameters).validate(contentType: ["text/plain","text/html"]).responseJSON { response in
        
            switch response.result
            {
               case .success(let value):
                
         
                print(value)
                
                finishedCallback(response.result)
               
                break
                
               case .failure( let failDic):
                 print(failDic)

                break
                
                
                
            }
         

            
        }
        
}
        
}
//        // 2.发送网络请求
//        Alamofire.request(URLString, method: method, parameters: parameters).validate(contentType: ["text/plain"]).responseJSON { (response) in
//
//            // 3.获取结果
//            guard let result = response.result.value else {
//                print(response.result.error!)
//                return
//            }
//
//            // 4.将结果回调出去
//            finishedCallback(result)
//        }
//    }
    
//    //get  post 请求
//        func request(paramenters: [String: AnyObject],methods: Method, urlStr:String,isShowHud: Bool, successBolck:@escaping ((_ result: [String: AnyObject]) -> ()), faill:@escaping((_ errorStr:[String : AnyObject]) ->()))
//                  {
//        //判断是需要get请求还是post请求
//        var netWorkMethod:HTTPMethod = .get
//        switch methods
//        {
//        case .GET:
//            netWorkMethod = .get
//            break
//        case .POST:
//            netWorkMethod = .post
//            break
//        default:
//            netWorkMethod = .get
//            break
//        }
//        let endUrl = getUrl(url: urlStr)
//        print("请求URL:\(endUrl)   \n请求参数:\(paramenters)\n请求类型:\(methods)")
//
//        if isShowHud {
//            HUD.flash(.progress)
//
//        }
//        AF.request(endUrl, method: netWorkMethod, parameters:paramenters).responseJSON { response in
//
//            if isShowHud {
//                HUD.hide()
//            }
//
//
//            switch response.result
//            {
//            case .success(let value):
//
//
//                print(value)
//                successBolck(value as! [String : AnyObject])
//                break
//
//            case .failure( let failDic):
//                print(failDic)
//
//                break
//
//
//
//            }
//
//
//
//        }
//
//    }
//
//
//
//}
