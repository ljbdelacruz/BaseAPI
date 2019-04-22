//
//  DevEnvironment.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 22/04/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


public enum ConnectionEnvironment{
    case prerelease;
    case dev;
    case prod;
    
    func getURL()->String{
        switch self{
        case .dev:
            return "";
        case .prerelease:
            return "";
        case .prod:
            return "";
        }
    }
}
