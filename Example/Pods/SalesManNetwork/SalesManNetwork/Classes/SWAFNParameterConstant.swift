//
//  SWAFNParameterConstant.swift
//  SalesManNetwork
//
//  Created by 谢艳 on 2018/10/30.
//

import Foundation
public struct SWLogin {
    public  static let username = "userAccount"
    public  static let password = "userPass"
    public  static let loginPath = "/login.do"
    public  static let verifyCodePath = "/sw/verify/code/sendVerifyCodeByUserPhone.do"
    public  static let resetPasswordPath = "/sw/verify/code/findPasswdByPhone.do"
}
public struct SWPersonal {
   
    public  static let userInfoPath = "/sw/salesman/info/data/getOne.do"
    public  static let balancePath = "/sw/balance/getBalance.do"
    public  static let customerCount = "/sw/salesman/member/getCustomerCountBySalesmanId.do"
}

public struct SWGlobal{
    public  static let callBack = "callBack"
    public  static let message = "message"
    public  static let status = "status"
    public  static let data = "data"
}

public struct SWError{
    public  static let networkError = "请检查网络连接"
    public  static let cookieExpired = "登录信息过期了"

}

public struct SWNotification{
    public static let SWCookieExpiredNotification = "swCookieExpiredNotification"
}
