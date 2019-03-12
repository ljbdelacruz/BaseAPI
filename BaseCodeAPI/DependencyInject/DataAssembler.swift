//
//  DataAssembler.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import Swinject
import SwinjectAutoregistration
import Moya

public class DataAssembly: Assembly {
    public static var instance=DataAssembly();
    public func assemble(container: Container) {
        container.register(NetworkLoggerPlugin.self) { r in
            NetworkLoggerPlugin(verbose: true)
            }.inObjectScope(.container)
        container.register(MyAPI.self) { (r) in
            let service = MyAPI(plugins: [
                r.resolve(NetworkLoggerPlugin.self)!])
            return service
        }
        container.autoregister(UserRepository.self, initializer: UserRepository.init).inObjectScope(.container)
    }
}


