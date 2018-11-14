//
//  SWNormalTableViewCell.swift
//  SalesManPersonalSetting
//
//  Created by 谢艳 on 2018/11/12.
//

import UIKit
import SalesManGlobal
class SWNormalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.standardizeStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func showTitle(title:String,imageName:String){
        self.titleLabel.text = title
        self.descImgView.image = UIImage.imageNamed(name: imageName, classCoder: self.classForCoder, bundleName: bundleName)
    }
}

//MARK:Private
extension SWNormalTableViewCell{
    func standardizeStyle()  {
        self.titleLabel.textColor = UIColor.swDarkTextColor()
    }
}
