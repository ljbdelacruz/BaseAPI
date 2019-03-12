//
//  MovieObject.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import ObjectMapper

//MARK:Param


//MARK:Response
public class MovieResponse: Mappable {
    public var id:Int?;
    public var title:String?;
    public var description:String?;
    public var posterImage:String?
    public var promoImage:String?;
    public var videoPromo:String?;
    public var isSeries:Int?;
    public required init?(map: Map) {
    }
    public init(id:Int){
        self.id=id;
    }
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        promoImage <- map["profileImage"]
        videoPromo <- map["videoPromo"]
        isSeries <- map["isSeries"]
    }
}
