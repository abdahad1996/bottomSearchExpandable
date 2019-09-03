//
//  TableViewCell.swift
//  JKBottomSearchViewExample
//
//  Created by Jarosław Krajewski on 11/04/2018.
//  Copyright © 2018 Jarosław Krajewski. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var circleView: UIView!
    @IBOutlet private var _imageView: UIImageView!
    override var imageView: UIImageView?{
        get{ return _imageView}
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
