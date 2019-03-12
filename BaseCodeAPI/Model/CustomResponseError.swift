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

public class CustomAPIError: Mappable {
    public var statusCode: Int!
    public var error: String!
    public func content() -> String {
        return "";
    }
    public init() {
    }
    public required init?(map: Map) {
    }
    public func mapping(map: Map) {
        statusCode <- map["statusCode"]
        error <- map["error"]
    }
}
extension CustomAPIError: Swift.Error, LocalizedError {
    public var errorDescription: String? {
        return content()
    }
    
}
