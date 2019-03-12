//
//  CustomResponseError.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class CustomAPIError: Mappable {
    
    var statusCode: Int!
    var error: String!
    
    func content() -> String {
        return "";
    }
    init() {
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        statusCode <- map["statusCode"]
        error <- map["error"]
    }
    
}

extension CustomAPIError: Swift.Error, LocalizedError {
    
    var errorDescription: String? {
        return content()
    }
    
}
