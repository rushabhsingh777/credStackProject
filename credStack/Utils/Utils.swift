//
//  Utils.swift
//  credStack
//
//  Created by Rushabh Singh on 23/03/21.
//  Copyright © 2021 Rushabh Singh. All rights reserved.
//

import Foundation
import UIKit

class Utils : NSObject {
    
    func heightForLabel(text: String, font: UIFont, width: CGFloat) -> CGFloat {

       let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
       label.numberOfLines = 0
       label.lineBreakMode = NSLineBreakMode.byWordWrapping
       label.font = font
       label.text = text
       label.sizeToFit()

       return label.frame.height
    }
}
