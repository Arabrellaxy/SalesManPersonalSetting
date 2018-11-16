//
//  SWPersonalHeader.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/12.
//

import UIKit
class SWPersonalHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var moneySumTitleLabel: UILabel!
    @IBOutlet weak var customerCountTitleLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var workNoLabel: UILabel!

    override func awakeFromNib() {
        self.standlizeStyle()
    }
    public func fillDataWith(result:[String]){
        self.nameLabel.text = result[1]
        self.phoneLabel.text = result[2]
        self.workNoLabel.text = result[3]
        self.sumLabel.text = result[4]
        self.countLabel.text = result[5]
    }
}

//MARK Private
extension SWPersonalHeader{
    func standlizeStyle() {
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
        self.nameLabel.numberOfLines = 0
        self.sumLabel.numberOfLines = 0
        self.countLabel.numberOfLines = 0
        self.moneySumTitleLabel.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 00.5)
        self.customerCountTitleLabel.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha:0.5)
    }
}
