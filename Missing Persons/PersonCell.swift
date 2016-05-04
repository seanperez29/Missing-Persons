//
//  PersonCell.swift
//  Missing Persons
//
//  Created by Sean Perez on 5/3/16.
//  Copyright © 2016 Awsome. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImg: UIImageView!
    
    func configureCell(imgUrl: String) {
        
        if let url = NSURL(string: imgUrl) {
            downloadImage(url)
        }
    }
    
    func downloadImage(url: NSURL) {
        getDataFromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.personImg.image = UIImage(data: data)
            }
        }
    }
    
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            completion(data: data, response: response, error: error)
            
        }.resume()
    }
}
