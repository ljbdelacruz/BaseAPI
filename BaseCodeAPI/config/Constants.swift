//
//  Constants.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

public class Constants{
    public static var baseURL:String="http://localhost:8080";
    public static var jwot:String="";
    public static var jwot_pass:String="";
    public static var refreshToken:String="";
    public static var errorCatcher:ErrorCatcher=ErrorCatcher();    
    
    public static var deviceID:String="";
    public static var fcmToken:String="";
    
    
    
    
    public static func SetEnvironment(connEnv:ConnectionEnvironment){
        self.baseURL=connEnv.getURL();
    }
    
}
