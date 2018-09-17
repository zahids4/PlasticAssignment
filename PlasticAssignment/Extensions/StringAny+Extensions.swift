//
//  StringAny+Extensions.swift
//  PlasticAssignment
//
//  Created by Saim Zahid on 2018-09-17.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    func stringValueForKey(_ key: Key) -> String {
        return self[key] as! String
    }
}
