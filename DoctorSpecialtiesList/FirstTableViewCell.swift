//
//  FirstTableViewCell.swift
//  DoctorSpecialtiesList
//
//  Created by Sakshi Yelmame on 13/04/23.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    static let identifier = "FirstTableViewCell"

    @IBOutlet weak var drNameUILabel: UILabel!
    
    @IBOutlet weak var drUIImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
    }
    
    public func configure(drName : String, drImageName : String){
        self.drNameUILabel.text = drName
        self.drUIImageView.image = UIImage(named: drImageName)
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
