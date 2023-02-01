//
//  UserTableViewCell.swift
//  TaskManager
//
//  Created by english on 2022-11-28.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblEmail : UILabel!
    @IBOutlet var imgLogged : UIImageView!
    
    
    func setContent ( user : UserModel ) {
        
        lblName.text = user.name.capitalized
        lblEmail.text = user.email.uppercased()
        
        if user.uid == Session.loggedUser?.uid
        {
            imgLogged.image = .init(systemName:
            "star.fill")
        }else
        {
            imgLogged.image = nil
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
