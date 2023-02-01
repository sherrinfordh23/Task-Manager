//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by english on 2022-11-28.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    static let identifier = "TaskTableViewCell"
    
    @IBOutlet var lblDescription : UILabel!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var imgDone: UIImageView!
    
    func setContent ( task : TaskModel  ) {
        
        lblDescription.text = task.description
        lblName.text = task.createdByName.uppercased()
        
        if task.done{
            imgDone.image = .checkmark
        }
        else
        {
            imgDone.image = .init(systemName: "xmark")
        }
            
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
