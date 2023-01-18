//
//  TourismTableViewCell.swift
//  SubmissionApp
//
//  Created by Andrian Oktiawan on 18/01/23.
//

import UIKit

class TourismTableViewCell: UITableViewCell {

    @IBOutlet var tourismImageView: UIImageView!
    
    @IBOutlet var tourismLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
