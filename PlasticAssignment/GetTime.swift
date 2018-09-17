//
//  GetTime.swift
//  PlasticAssignment
//
//  Created by Saim Zahid on 2018-09-17.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import Foundation
import Alamofire

struct GetTime {
    static func current(completionHandler: @escaping (String?, Error?) -> ()) {
        Alamofire.request("https://dateandtimeasjson.appspot.com").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                completionHandler((value as! [String:Any]).stringValueForKey("datetime"), nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
