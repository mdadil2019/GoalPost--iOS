//
//  ViewController.swift
//  goalpost
//
//  Created by Mohammad Adil on 28/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }

    @IBAction func addGoalButtonPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else {return}
        presentDetail(createGoalVC)
    }
    
    func fetchCoreDataObjects(){
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
                
            }
        }
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configureCell(description: goal.goalDescription!, type: goal.goalType!, goalProgressAmt: Int(goal.goalProgress))
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        return [deleteAction]
    }
}

extension GoalsVC{
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContext.delete(goals[indexPath.row])
        do{
            try managedContext.save()
            print("Sucessfully removed!")
        }catch{
            debugPrint("Could not removed:\(error.localizedDescription)")
        }
    }
    
    
    func fetch(completion: (_ complete: Bool)-> ()){
        guard let manageContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do{
            goals = try manageContext.fetch(fetchRequest) as! [Goal]
            debugPrint("Successfully fetched data")
            completion(true)
        }catch{
            debugPrint("Could not fetch:\(error.localizedDescription) ")
        }
        
    }
}

