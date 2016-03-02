//
//  APIManager.swift
//  MusicVideo
//
//  Created by Justin Lee on 3/2/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        // to set Cache off
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        //let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
                if error != nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: (error!.localizedDescription))
                    }
                } else {
                    print(data)
                    
                    do {
                     if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                        as? [String: AnyObject] {
                            
                            print(json)
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()) {
                                    completion(result: "JSONSerilization Successful")
                                    }
                                }
                            }
                        
                        } catch {
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "error in NSJSONSerialization")
                            }
                        }  // end of else
                }
        }
        
        task.resume()
    }
}
