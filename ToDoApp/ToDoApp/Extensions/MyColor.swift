//
//  MyColor.swift
//  ToDoApp
//
//  Created by Soo J on 2022/08/25.
//

import Foundation
import UIKit

enum MyColor: Int64 {
    case red    = 1
    case green  = 2
    case blue   = 3
    case yellow = 4
    
    var backgoundColor: UIColor {
        switch self {
        case .red:
            //UIColor(hexString: "#EFD9D4")
            return UIColor(red: 239/255, green: 217/255, blue: 212/255, alpha: 1)
        case .green:
            //UIColor(hexString: "#C2EDEA")
            return UIColor(red: 194/255, green: 237/255, blue: 234/255, alpha: 1)
        case .blue:
            //UIColor(hexString: "#C4E4F2")
            return UIColor(red: 196/255, green: 228/255, blue: 242/255, alpha: 1)
        case .yellow:
            //UIColor(hexString: "#F5FFB2")
            return UIColor(red: 245/255, green: 255/255, blue: 178/255, alpha: 1)
        }
    }
    
    var buttonColor: UIColor {
        switch self {
        case .red:
            return UIColor(red: 232/255, green: 163/255, blue: 153/255, alpha: 1)
        case .green:
            return UIColor(red: 89/255, green: 190/255, blue: 183/255, alpha: 1)
        case .blue:
            return UIColor(red: 88/255, green: 181/255, blue: 236/255, alpha: 1)
        case .yellow:
            return UIColor(red: 255/255, green: 251/255, blue: 0/255, alpha: 1)
        }
    }
    
}
