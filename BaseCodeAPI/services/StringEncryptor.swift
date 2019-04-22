//
//  StringEncryptor.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import SwiftyRSA;

public class StringEncryptor {
    public let publicKey = try! PublicKey(pemNamed: "mypublic_k")
    public func encrypt(message: String) -> String {
        let testText = try! ClearMessage(string: message, using: .utf8)
        let encrytped = try! testText.encrypted(with: publicKey, padding: .PKCS1)
        let base64String = encrytped.base64String
        return base64String
    }
}
