//
//  SWScrollableTableViewCell.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/12.
//

import UIKit
import SalesManGlobal
class SWScrollableTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
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
extension SWScrollableTableViewCell {
    @objc func buttonClicked(button:UIButton){
        let index = button.tag
        print(index)
    }
}
//MARK:Private
extension SWScrollableTableViewCell{
    func standardizeStyle()  {
        let items:[(String,String)] = [("zhongjin","中金账号"),("address","收获地址"),("bankcard","银行卡"),("activity","活动")]
        for (index,_) in items.enumerated() {
            let button = self.itemWith(item: items[index])
            button.tag = index
            button.addTarget(self, action: #selector(buttonClicked(button:)), for: UIControlEvents.touchUpInside)
            self.stackView.addArrangedSubview(button)
        }
    }
    func itemWith(item:(imageName:String,title:String)) ->UIButton {
        let itemContainer = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 60))
        itemContainer.setTitleColor(UIColor.lightGray, for: .normal)
        let itemImage = UIImage.imageNamed(name: item.imageName, classCoder: self.classForCoder, bundleName: bundleName)
        itemContainer.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        itemContainer.setImage(itemImage, for: .normal)
        itemContainer.setTitle(item.title, for: .normal)
        itemContainer.verticalAlignmentWithTitleTop(titleTop: false, space: 20)
        return itemContainer
    }
}


