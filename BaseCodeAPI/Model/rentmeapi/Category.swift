//
//  Category.swift
//  BaseCodeAPI
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

public class CategoryModel: Mappable {
    public var id: Int?
    public var name: String?
    public var parent: String?
    
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        parent <- map["parent"]
    }
    
}
