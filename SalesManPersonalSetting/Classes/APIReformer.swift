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
    public func userInfo()->(valueArray:[String]?,success:Bool,message:String?) {
        var failureMessage = "请求失败,请稍后重试"
        var tempSuccess = true
        let tempValueArray = NSMutableArray.init()
        let userInfoDic:NSDictionary = self.responseArray[0]
        let userDic:NSDictionary? = (userInfoDic.object(forKey: "data") as? NSDictionary)?.object(forKey: "sysUser") as? NSDictionary
        let userInfoSuccess = userInfoDic.object(forKey: "status") as! Bool
        
        let balanceDic:NSDictionary = self.responseArray[1]
        let balance:String? = (balanceDic.object(forKey: "data") as? NSDictionary)?.object(forKey: "totalBalance") as? String ?? "0"
        let balanclSuccess = balanceDic.object(forKey: "status") as! Bool
        
        let customerCountDic:NSDictionary = self.responseArray[2]
        let customerCount = "\(customerCountDic.object(forKey: "data") ?? 0)"
        let customerCountSuccess = customerCountDic.object(forKey: "status") as! Bool
        
        if userInfoSuccess {
            tempValueArray.addObjects(from: [(userDic!.object(forKey: "userPhoto") as? String) ?? "",
                                             (userDic!.object(forKey: "userName") as? String) ?? "",
                                             (userDic!.object(forKey: "userPhone") as? String) ?? "",
                                             (userDic!.object(forKey: "userAddr") as? String) ?? ""])
        } else {
            let userInfoMessage:String? = userInfoDic.object(forKey: "message") as? String
            failureMessage = userInfoMessage ?? failureMessage
            tempValueArray.addObjects(from: ["","","",""])
            tempSuccess = false
        }
        
        if  balanclSuccess {
            tempValueArray.add(balance!)
        } else {
            let balanclMessag:String?  = balanceDic.object(forKey: "message") as? String
            failureMessage = balanclMessag ?? failureMessage
            tempValueArray.add(balance!)
            tempSuccess = false
        }
        
        if customerCountSuccess {
            tempValueArray.add(customerCount)
        }else {
            let customerCountMessage : String? = customerCountDic.object(forKey: "message") as? String
            failureMessage = customerCountMessage ?? failureMessage
            tempValueArray.add("")
            tempSuccess = false
        }
        
        
        return ((tempValueArray.copy() as! [String]),tempSuccess,failureMessage)
    }
}
