//
//  GoalCell.swift
//  goalpost
//
//  Created by Mohammad Adil on 28/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    
    @IBOutlet weak var goalType: UILabel!
    
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(description: String, type: String, goalProgressAmt: Int){
        self.goalDescriptionLbl.text = description
        
        self.goalType.text = type
        self.goalProgressLbl.text = String(describing: goalProgressAmt)
    }

}
