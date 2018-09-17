//
//  Helpers.swift
//  PlasticAssignment
//
//  Created by Saim Zahid on 2018-09-17.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import Foundation
import Alamofire

struct Helpers {
    static func getCurrentTime(completionHandler: @escaping (String?, Error?) -> ()) {
        Alamofire.request("https://dateandtimeasjson.appspot.com").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                completionHandler((value as! [String:Any]).stringValueForKey("datetime"), nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    static func areViewsColliding(_ view1: UIView,_ view2: UIView) -> Bool{
        return view1.layer.frame.intersects(view2.layer.frame)
    }
}
