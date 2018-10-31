//
//  ViewController.swift
//  goalpost
//
//  Created by Mohammad Adil on 28/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addGoalButtonPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else {return}
        presentDetail(createGoalVC)
    }
    
}

