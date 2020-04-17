//
//  CommentTableViewCell.swift
//  Product Hunt Tutorial
//
//  Created by Henry Calderon on 4/17/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var commentTextView: UITextView!
    
    //=====================================Stuff we don't need==========================
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
