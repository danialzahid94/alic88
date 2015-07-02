//
//  CategoryTableViewCell.swift
//  alic88
//
//  Created by Danial Zahid on 02/07/2015.
//  Copyright (c) 2015 Danial Zahid. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    //MARK: - Outlets declaration
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - View LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
