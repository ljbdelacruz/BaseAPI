//
//  CommonResponse.swift
//  BaseCodeAPI
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import ObjectMapper

public class CommonResponse: Mappable {
    public var statusCode: Int?
    public var description: String?
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        statusCode <- map["statusCode"]
        description <- map["description"]
    }    
}
