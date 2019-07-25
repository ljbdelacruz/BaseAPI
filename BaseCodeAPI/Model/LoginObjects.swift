//
//  LoginAuthentication.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

//MARK: Param
public class LoginParam: Mappable {
    struct defaultValues {
        static let grantType = "password"
        static let scope = "read write"
    }
    public var username: String?
    public var password: String?
    public init(username: String, password: String) {
        self.username = username
        let encryptor = StringEncryptor()
        self.password = encryptor.encrypt(message: password)
    }
    public required init?(map: Map) {
    }
    public func mapping(map: Map) {
        username <- map["username"]
        password <- map["password"]
    }
    public func validateInput()->(Bool, String){
        if self.username!.isEmpty || self.password!.isEmpty {
            return (false, "Please do not leave username or password empty");
        }
        if self.username!.isValidEmail() || self.password!.isValidPassword(){
            return (false, "Please match the requested format for Password (At least one letter, one number and one special character)");
        }
        return (true, "");
    }
}
//MARK: Response
public class LoginResponse: Mappable {
    public var accessToken: String?
    public required init?(map: Map) {
    }
    public func mapping(map: Map){
        accessToken <- map["access_token"]
    }
}



