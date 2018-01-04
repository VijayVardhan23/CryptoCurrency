//
//  CryptoCurrencyTableViewCell.swift
//  CryptoCurrency
//
//  Created by kalimi venkata vijay vardhan on 31/12/17.
//  Copyright © 2017 kalimi venkata vijay vardhan. All rights reserved.
//

import UIKit

class CryptoCurrencyTableViewCell: UITableViewCell{

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var usdValueField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var lastDayField: UILabel!
    @IBOutlet weak var lastWeekField: UILabel!
    @IBOutlet weak var lastDay24hrField: UILabel!
    @IBOutlet weak var lastWeek7dField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
