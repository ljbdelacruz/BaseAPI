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
    case Authenticate(param:LoginParam);
    //movieAPI
    case allMovieWithLimit(limit:Int)
    
}
extension APIService: TargetType {
    var baseURL: URL {
        let urlString = Constants.baseURL;
        return URL(string: urlString)!
    }
    var path: String {
        switch self {
            case .Authenticate(let param):
                return "/login";
            case .allMovieWithLimit(let limit):
                return "vstream/movies/\(limit)"
        }
    }
    var method: Moya.Method {
        switch self {
        case .Authenticate:
            return .post;
        case .allMovieWithLimit:
            return .get;
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
            case .Authenticate,
                 //movies
                 .allMovieWithLimit:
                return .requestPlain;
        }
    }
    // MARK - Header
    var headerBasicAuthClient: String{
        return Constants.jwot;
    }
    var headers: [String: String]? {
        switch self {
        case .Authenticate,
             //movies
             .allMovieWithLimit:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}


