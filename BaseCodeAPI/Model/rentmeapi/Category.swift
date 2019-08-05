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
    //pass this api when sending body post
    public func mcToJSON()->Dictionary<String, Any>{
        var dict=Dictionary<String, Any>();
        dict["id"]=self.id;
        dict["parent"]=self.parent;
        dict["name"]=self.name;
        return dict;
    }
}


extension CategoryModel{
    static func filterByName(list:[CategoryModel], search:String)->[CategoryModel]{
        return list.filter({$0.name!.contains(search)});
    }
    static func fetchByID(id:Int, list:[CategoryModel])->CategoryModel{
        return list.filter({$0.id! == id})[0];
    }
    static func fetchByCategoryID(id:String, list:[CategoryModel])->[CategoryModel]{
        return list.filter({$0.parent!.elementsEqual(id)});
    }
}
