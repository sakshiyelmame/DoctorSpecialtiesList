//
//  ViewController.swift
//  DoctorSpecialtiesList
//
//  Created by Sakshi Yelmame on 13/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var drSpecialtiesSearchBar: UISearchBar!
    
    @IBOutlet weak var drSpecialtiesTableView: UITableView!
    
    var drList = [Doctors]()
    var searchDr = [Doctors]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchDr.count
        }
        else
        {
            return drList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = drSpecialtiesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchDr[indexPath.row].name
            cell.imageView?.image = UIImage(named: drList[indexPath.row].imagename)
            cell.imageView?.sizeToFit()
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
        }
        else
        {
            cell.textLabel?.text = drList[indexPath.row].name
            cell.imageView?.image = UIImage(named: drList[indexPath.row].imagename)
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            searching = true
            searchDr.removeAll()
            for doctors in drList {
                if doctors.name.lowercased().contains(searchText.lowercased())
                {
                    searchDr.append(doctors)
                }
            }
        }
        else
        {
            searching = false
            searchDr.removeAll()
            searchDr = drList
        }
        drSpecialtiesTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        drSpecialtiesTableView.reloadData()
    }
    
    func fetchData() {
    guard let fileLocation = Bundle.main.url(forResource: "Doctor", withExtension: "json")
        else
        {
            return
        }
        do
        {
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([Doctors].self, from: data)
            self.drList = receivedData
            DispatchQueue.main.async {
                self.drSpecialtiesTableView.reloadData()
            }
        }
        catch
        {
            print("Error while decoding json")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: .main)
        let vc = main.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        if searching == true {
            vc.selectedDoctorsInfo = Doctors(name: searchDr[indexPath.row].name, imagename: searchDr[indexPath.row].imagename, description: searchDr[indexPath.row].description)
        }
        else{
            vc.selectedDoctorsInfo = Doctors(name: drList[indexPath.row].name, imagename: drList[indexPath.row].imagename, description: drList[indexPath.row].description)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

