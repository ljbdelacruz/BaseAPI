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
            return "http://192.168.88.23:8080/";
        case .prerelease:
            return "http://192.168.88.23:8080/";
        case .prod:
            return "http://192.168.88.23:8080/";
        }
    }
}
