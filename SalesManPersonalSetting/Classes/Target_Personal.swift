//
//  Target_Personal.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/14.
//

import UIKit
class Target_Personal : NSObject {
    @objc  func Action_viewController(_ params:[AnyHashable:Any]?) -> UIViewController{
        let bundle1 = Bundle.init(for: SWPersonalTableViewController.classForCoder())
        let path = bundle1.path(forResource: bundleName, ofType: "bundle")!
        
        let bundle:Bundle = Bundle.init(path:path)!
        let vc:SWPersonalTableViewController = UIStoryboard.init(name: "Main", bundle: bundle).instantiateViewController(withIdentifier: "SWPersonalTableViewController") as! SWPersonalTableViewController
        return vc
    }
}
