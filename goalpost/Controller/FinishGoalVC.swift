//
//  FinishGoalVC.swift
//  goalpost
//
//  Created by Mohammad Adil on 30/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTxtField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalButton.bindToKeyBoard()
        pointsTxtField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createGoalPressed(_ sender: Any) {
        //pass data into core Goal Model
        debugPrint("Button Clicked")
        self.save { (complete) in
            if complete{
                print("Successfully saved data")
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func save(completion: (_ finished: Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = description
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTxtField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
        }catch{
            debugPrint("Could not save items because \(error.localizedDescription)")
        }
        
    }
    
}
