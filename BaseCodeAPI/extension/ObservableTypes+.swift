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
        return self.filterSuccessfulStatusCodes()
            .catchError { e in
                guard let error = e as? MoyaError else {
                    throw e
                }
                guard case .statusCode(let response) = error else {
                    throw e
                }
                if let apiError = try? response.mapObject(CustomAPIError.self) {
                    print(response.statusCode);
                }
                throw e;
        }
        
    }
}

