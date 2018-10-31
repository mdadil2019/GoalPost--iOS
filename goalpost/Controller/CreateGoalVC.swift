//
//  CreateGoalVC.swift
//  goalpost
//
//  Created by Mohammad Adil on 30/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController,UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.bindToKeyBoard()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
        goalTextView.delegate = self
    }
    
    @IBAction func longTermBtnPresse(_ sender: Any) {
        goalType = .longTerm
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        //moving from one view conroller to another at runtime with code rather then view controller
        //segues. We have also used custom animations for showing new view controller in the extension
        //UIViewControllerExt so the method presentDetails show the animated form of the view controller
        if goalTextView.text != "" && goalTextView.text != "What is your goal?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else {return}
            //passing the data from CreateGoalVC to another (Finish Goal VC)
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondDetails(finishGoalVC)
            
        }
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
}
