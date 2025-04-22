//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Danillo Diniz Barbosa on 16/04/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBubleView: UIView!
    @IBOutlet weak var meImageView: UIImageView!
    @IBOutlet weak var youImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubleView.layer.cornerRadius = messageBubleView.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
