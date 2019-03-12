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
    public init(service: MyAPI){
        self.service = service
    }
    public func getMoviesWithLimit(limit:Int) -> Observable<[MovieResponse]> {
        //mapping array object
        return service.rx.request(.allMovieWithLimit(limit: limit))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    public func getByInfo(id:Int) -> Observable<MovieResponse> {
        //sample mapping only an object
        return service.rx.request(.getMovieInfo(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapObject(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    public func getMoviesByTitle(title:String, limit:Int) -> Observable<[MovieResponse]> {
        return service.rx.request(.getMovieSearchByTitle(title: title, limit:limit))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    
    
}

