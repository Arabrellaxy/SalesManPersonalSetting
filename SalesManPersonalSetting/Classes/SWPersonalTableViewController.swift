//
//  SWPersonalTableViewController.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/12.
//

import UIKit
import SalesManGlobal
import SalesManNetwork
import SalesManDataStorage
import MJRefresh
public class SWPersonalTableViewController: UITableViewController {
    let cellIdentifier = ["SeparatedCell","ScrollableCell","normalCell"]
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.edgesForExtendedLayout = .top
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false
        }
        self.tableView.backgroundColor = UIColor.swGreyColor()
        let image = UIImage.imageNamed(name: "setting",classCoder:self.classForCoder,bundleName:bundleName).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(settingAction))
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        let header = MJRefreshNormalHeader.init {
            self.requestData()
        }
        header?.stateLabel.isHidden = true
        self.tableView.mj_header = header
        self.tableView.mj_header.beginRefreshing()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:Action
extension SWPersonalTableViewController {
    @objc func settingAction(){
    
    }
}
//MARK:TABLEVIEW DELEGATE & DATASOURCE
extension SWPersonalTableViewController {
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 2 ? 4 : 1
    }
    
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[indexPath.section], for: indexPath)
        if indexPath.section == 2 {
            let descArray:[(String,String)] = [("负责地区","region_center"),("数据中心","data_center"),("资金中心","money_center"),("活动中心","activity_center")]
            let tempDesc = descArray[indexPath.row]
            let tempCell:SWNormalTableViewCell = cell as! SWNormalTableViewCell
            tempCell.showTitle(title: tempDesc.0, imageName: tempDesc.1)
        }
        return cell
    }
    override public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    public override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
    }
    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
    }
    
    public override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

//MARK Private
extension SWPersonalTableViewController {
    func requestData()  {
        let userID = SWDataStorage.init().userID
        SalesManAFNetworkAPI.shareInstance.requestPersonalData(userId: userID!) { [unowned self](resultArray) in
            let apiReformer = APIReformer.init(responseArray: resultArray as! [NSDictionary])
            let header:SWPersonalHeader =  self.tableView.tableHeaderView as! SWPersonalHeader
            let (valueArray,success,message) = apiReformer.userInfo()
            if success {
                header.fillDataWith(result: valueArray!)
            } else{
                self.view.showTextHud(text: message!, autoHide: true)
            }
            self.tableView.mj_header.isHidden = true
        }
    }
}
