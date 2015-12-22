//
//  StatusCell.swift
//  Live Upload Parse
//
//  Created by Miguel Fagundez on 12/21/15.
//  Copyright © 2015 Miguel Fagundez. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
