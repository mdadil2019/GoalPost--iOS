//
//  UIViewControllerExt.swift
//  goalpost
//
//  Created by Mohammad Adil on 30/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit

extension UIViewController{
    //we will be overriding the default animation when the view presents or ends.
    func presentDetail(_ viewContollerToPresent: UIViewController){
        let transistion = CATransition()
        transistion.duration = 0.3
        transistion.type = CATransitionType.push
        transistion.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transistion,forKey: kCATransition)
        
        
        //if animated will be true then default animation will override our animation
        present(viewContollerToPresent,animated: false,completion: nil)
    }
    
    func presentSecondDetails(_ viewContollerToPresent: UIViewController){
        let transistion = CATransition()
        transistion.duration = 0.3
        transistion.type = CATransitionType.push
        transistion.subtype = CATransitionSubtype.fromRight
        
        guard let presentedViewController = presentedViewController else {return}
        
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transistion,forKey: kCATransition)
            self.present(viewContollerToPresent,animated: false,completion: nil)
        }
        
    }
    
    func dismissDetail(){
        let transistion = CATransition()
        transistion.duration = 0.3
        transistion.type = CATransitionType.push
        transistion.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transistion,forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
