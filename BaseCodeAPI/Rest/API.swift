//
//  API.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Alamofire
import Moya
import ObjectMapper
import Firebase

public class MyAPI: MoyaProvider<APIService> {
    init(plugins: [PluginType] = []) {
    }
}
enum APIService  {
    //category
    case getCategoryByID(id:String)
    case getCategoryListByParentID(id:String)
    case newCategory(body:CategoryModel)
}
extension APIService: TargetType {
    var baseURL: URL {
        let urlString = Constants.baseURL;
        return URL(string: urlString)!
    }
    var path: String {
        switch self {
            case .getCategoryByID(let id):
                return "/category/"+id;
            case .getCategoryListByParentID(let id):
                return "/category/list/all/"+id
            case .newCategory:
                return "/category/new"
        }
    }
    var method: Moya.Method {
        switch self {
        case .newCategory:
            return .post;
        case .getCategoryByID, .getCategoryListByParentID:
            return .get;
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
            case .getCategoryByID, .getCategoryListByParentID:
                return .requestPlain;
            case .newCategory(let body):
                return .requestParameters(parameters: body.toJSON(), encoding: URLEncoding(destination: .queryString))
        }
    }
    // MARK - Header
    var headerBasicAuthClient: String{
        return Constants.jwot;
    }
    var headers: [String: String]? {
        switch self {
        case .newCategory, .getCategoryByID, .getCategoryListByParentID:
            return getHeader(headerUsageType: .basic1)
        }
    }
}

extension APIService{
    //implement header modification here this will get executed before sending the request to server
    func getHeader(headerUsageType:HeaderUsageType)->[String: String]{
        switch headerUsageType {
            case .basic1:
                return ["Accept": "application/json",
                        "Content-Type": "application/x-www-form-urlencoded"]
            default:
                return ["Accept": "application/json",
                        "Content-Type": "application/json"]
        }
    }
}


