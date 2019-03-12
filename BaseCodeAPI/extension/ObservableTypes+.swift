//
//  ObservableTypes+.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Moya
import RxSwift
extension ObservableType where E == Response {
    func mapErrors(provider: MyAPI) -> Observable<E> {
        //getting refresh token token
        //        var refreshTokenRequest: Observable<Response>?
        return self.filterSuccessfulStatusCodes()
            .catchError { e in
                throw e;
        }
        
    }
}

