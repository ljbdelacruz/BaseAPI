//
//  ErrorCatcher.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 22/04/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

public class ErrorCatcher{
    public var statusCode:Int=0;
    public var errorMessage:String="";
    public init(){}
    public convenience init(scode:Int, errMessage:String){
        self.init();
        self.statusCode=scode;
        self.errorMessage=errMessage;
    }
    public func empty(){
        self.statusCode=0;
        self.errorMessage="";
    }
}
