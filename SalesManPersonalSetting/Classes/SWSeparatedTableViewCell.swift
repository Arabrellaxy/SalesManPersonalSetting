//
//  SWSeparatedTableViewCell.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/12.
//

import UIKit
import SalesManGlobal
class SWSeparatedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cashBtn: UIButton!
    @IBOutlet weak var chargeBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.standardizeStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//MARK:Action
extension SWSeparatedTableViewCell {
    @IBAction func cashAction(_ sender: Any) {
    }
    @IBAction func chargeAction(_ sender: Any) {
    }
}
//MARK:Private
extension SWSeparatedTableViewCell {
    func standardizeStyle() {
        self.cashBtn.setTitleColor(UIColor.swThemeColor(), for: UIControlState.normal)
        self.chargeBtn.setTitleColor(UIColor.swThemeColor(), for: UIControlState.normal)
    }
}

