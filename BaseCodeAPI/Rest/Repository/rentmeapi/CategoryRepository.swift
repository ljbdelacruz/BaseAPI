//
//  CategoryRepository.swift
//  BaseCodeAPI
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

public class CategoryRepository {
    private let service: MyAPI!
    public init(service: MyAPI) {
        self.service = service
    }
    public func getByID(id:String)->Observable<CategoryModel>{
        return service.rx
            .request(.getCategoryByID(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapObject(CategoryModel.self)
    }
    public func getAll(parentID:String)->Observable<[CategoryModel]>{
        return service.rx.request(.getCategoryListByParentID(id: parentID))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(CategoryModel.self)
    }
    public func new(body:CategoryModel)->Observable<CommonResponse>{
        return service.rx.request(.newCategory(body: body))
               .asObservable()
               .mapErrors(provider: service)
               .mapObject(CommonResponse.self)    }
}
