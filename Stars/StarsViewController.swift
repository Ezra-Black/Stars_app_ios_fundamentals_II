//
//  ViewController.swift
//  Stars
//
//  Created by Joseph Rogers on 8/8/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let controller = StarController()
//        controller.createStar(named: "Sun", withDistance: 0)
    }

    @IBAction func printStars(_ sender: Any) {
        print(starController.listStars())
    }
    
    
    @IBAction func createStar(_ sender: Any) {
        
        guard let name = nameTextField.text,
        let distanceString = distanceTextField.text,
            !name.isEmpty,
            !distanceString.isEmpty,
            let distance = Double(distanceString) else {return}
        
        starController.createStar(named: name, withDistance: distance)
        nameTextField.text = ""
        distanceTextField.text = ""
        nameTextField.becomeFirstResponder()
        distanceTextField.becomeFirstResponder()
        tableView.reloadData()
    }
    
    
    
}


extension StarsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
        
        let star = starController.stars[indexPath.row]
        cell.star = star
        
        return cell
    }
    
    
}
