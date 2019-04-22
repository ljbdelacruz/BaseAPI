//
//  APIError.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 22/04/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import ObjectMapper


public class APIError: Mappable {
    public var statusCode: Int!
    public var error: String!
    public var errorDesc: String!
    public var message: String?
    public init() {
    }
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        statusCode <- map["statusCode"]
        error <- map["error"]
        errorDesc <- map["error_description"]
        message <- map["message"]
    }
    
}

