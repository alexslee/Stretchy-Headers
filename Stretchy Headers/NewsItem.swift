//
//  NewsItem.swift
//  Stretchy Headers
//
//  Created by Alex Lee on 2017-07-03.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

struct NewsItem {
    enum NewsCategory {
        
        case World
        case Americas
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
        
        func toString() -> String {
            switch self {
            case .World:
                return "World"
            case .Americas:
                return "Americas"
            case .Europe:
                return "Europe"
            case .MiddleEast:
                return "Middle East"
            case .Africa:
                return "Africa"
            case .AsiaPacific:
                return "Asia-Pacific"
            }
        }
        
        func toColor() -> UIColor {
            switch self {
            case .World:
                return FlatRed()
            case .Americas:
                return FlatBlue()
            case .Europe:
                return FlatGreen()
            case .MiddleEast:
                return FlatYellow()
            case .Africa:
                return FlatOrange()
            case .AsiaPacific:
                return FlatPurple()
            }
        }
        
    }
    
    let category:NewsCategory
    
    let story:String
}
