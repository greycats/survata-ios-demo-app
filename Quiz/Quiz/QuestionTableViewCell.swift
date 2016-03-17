//
//  QuestionTableViewCell.swift
//  SurvataDemo
//
//  Created by Theresa Gao on 3/1/16.
//  Copyright © 2016 InteractiveLabs. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var TorF: UILabel!
    @IBOutlet weak var qTextView: UITextView!
    @IBOutlet weak var qSlider: UISlider!
    @IBOutlet weak var difference: UILabel!
    @IBOutlet weak var percentage: UILabel!
    var tableViewController : QuestionTableViewController? = nil
    var index = 0
    
    @IBAction func sliderChanged(sender: UISlider) {
        let val = sender.value
        let intVal:Int = Int(val)
        self.TorF.text = intVal.description
        let diff = abs(Int(self.percentage.text!)! - intVal)
        self.difference.text = diff.description
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
