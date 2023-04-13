//
//  SecondTableViewCell.swift
//  DoctorSpecialtiesList
//
//  Created by Sakshi Yelmame on 13/04/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    static let identifier = "SecondTableViewCell"

    @IBOutlet weak var discriptionUILabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }
    
    public func configure(drDiscription: String){
        self.discriptionUILabel.text = "\(drDiscription)"
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
