//
//  Image+Extensions.swift
//  swift-beers
//
//  Created by Dennis Merli on 6/12/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class ImageLoader {
    static func loadImageFromURL(_ url: URL?, placeHolder: UIImage?, completion:@escaping (_ image: UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        let qualityOfServiceClass = DispatchQoS.QoSClass.utility
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            if let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
                DispatchQueue.main.sync(execute: {
                    completion(image)
                })
                
            } else {
                DispatchQueue.main.sync(execute: {
                    completion(placeHolder)
                })
            }
        })
    }
}


