//
//  MovieRepository.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

public class MoviesRepository {
    private let service: MyAPI!
    init(service: MyAPI) {
        self.service = service
    }
    func getMoviesWithLimit(limit:Int) -> Observable<[MovieResponse]> {
        //mapping array object
        return service.rx.request(.allMovieWithLimit(limit: limit))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(MovieResponse.self).map({ resp in
                return resp;
            })
    }
}

