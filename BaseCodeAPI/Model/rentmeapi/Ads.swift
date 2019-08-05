//
//  Category.swift
//  BaseCodeAPI
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

public class AdsModel: Mappable {
    public var id: Int?
    public var title:String?;
    public var description:String?;
    public var price:Double?;
    public var categoryID:Int?;
    
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        price <- map["price"]
        categoryID <- map["categoryID"]
    }
    //pass this api when sending body post
    public func mcToJSON()->Dictionary<String, Any>{
        var dict=Dictionary<String, Any>();
        dict["id"]=self.id;
        dict["title"]=self.title;
        dict["description"]=self.description;
        dict["price"]=self.price;
        dict["categoryID"]=self.categoryID;
        return dict;
    }
}
extension AdsModel{
    public static func filterByName(list:[AdsModel], search:String)->[AdsModel]{
        return list.filter({$0.title!.contains(search)});
    }
    public static func filterByTitleCategoryID(list:[AdsModel], search:String, cid:Int)->[AdsModel]{
        return list.filter({$0.title!.contains(search) && $0.categoryID! == cid});
    }
    public static func getByID(id:Int, list:[AdsModel])->AdsModel{
        return list.filter({$0.id! == id})[0];
    }
}
