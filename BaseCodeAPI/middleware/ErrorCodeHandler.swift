//
//  ErrorCodeHandler.swift
//  BaseCodeAPI
//
//  Created by devops on 22/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

public class ErrorCodeHandler{
    public static var errorM:MyError=MyError();
    public static func checkErrorCode(statusCode:Int){
        errorM.statusCode=statusCode;
        switch statusCode{
        case 401:
            errorM.errorDesc="Session Timeout";
        case 400:
            errorM.errorDesc="Sorry system unavailable at this moment please try again later";
        case 503:
            errorM.errorDesc="Sorry system unavailable at this moment please try again later";
        default:
            break;
        }
    }
}

public struct MyError{
    public var statusCode:Int=0;
    public var errorDesc:String="";
}
