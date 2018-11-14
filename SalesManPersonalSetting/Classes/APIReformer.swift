//
//  APIReformer.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/14.
//

import UIKit

class APIReformer: NSObject {
    private var responseArray:[NSDictionary]!
    init(responseArray:[NSDictionary]){
        super.init()
        self.responseArray = responseArray
    }
    public func userInfo()->(String,String,String,String,String,String) {
        let userInfoDic:NSDictionary = self.responseArray[0]
        let userDic:NSDictionary? = (userInfoDic.object(forKey: "data") as? NSDictionary)?.object(forKey: "sysUser") as? NSDictionary
        let balanceDic:NSDictionary = self.responseArray[1]
        let balance:String? = (balanceDic.object(forKey: "data") as? NSDictionary)?.object(forKey: "totalBalance") as? String
        let customerCountDic:NSDictionary = self.responseArray[1]
        let customerCount:String? = customerCountDic.object(forKey: "data") as? String

        guard let _ = userDic else {
            return ("","","","","","")
        }
        return (
            (userDic!.object(forKey: "userPhoto") as? String)!,
            (userDic!.object(forKey: "userName") as? String)!,
            (userDic!.object(forKey: "userPhone") as? String)!,
            (userDic!.object(forKey: "userAddr") as? String)!,
            balance!,
            customerCount!
        )
    }
}
