//
//  InfoViewController.swift
//  DoctorSpecialtiesList
//
//  Created by Sakshi Yelmame on 13/04/23.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var InfoUITableView: UITableView!
    
    var selectedDoctorsInfo : Doctors?

        override func viewDidLoad() {
        super.viewDidLoad()
            InfoUITableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
            InfoUITableView.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = InfoUITableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
            if let name = selectedDoctorsInfo?.name, let imageName = selectedDoctorsInfo?.imagename {
                cell.configure(drName: name, drImageName: imageName)
            }
            return cell
        }
        let cell = InfoUITableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        if let name = selectedDoctorsInfo?.description {
            cell.configure(drDiscription: name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 250
        }
        return UITableView.automaticDimension
    }
}
