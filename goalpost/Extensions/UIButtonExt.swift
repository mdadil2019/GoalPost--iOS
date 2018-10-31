//
//  UIButtonExt.swift
//  goalpost
//
//  Created by Mohammad Adil on 30/10/18.
//  Copyright © 2018 Mohammad Adil. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3851893544, green: 0.8130287528, blue: 0.4228155017, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.5083900094, green: 0.6383350492, blue: 0.4964525104, alpha: 1)
    }
}
