//
//  UserRepository.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Firebase
import RxSwift
import Moya
import Moya_ObjectMapper

public class UserRepository {
    private let service: MyAPI!
    public init(service: MyAPI) {
        self.service = service
    }
    public func Authenticate(username:String, password:String)->Observable<LoginResponse>{
        let params=LoginParam(username: username, password: password);
        return service.rx
            .request(.Authenticate(param: params))
            .asObservable()
            .mapErrors(provider: service)
            .do(onNext: { (response) in
            })
            .mapObject(LoginResponse.self)
    }
    
}


