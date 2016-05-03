//
//  ViewController.swift
//  Missing Persons
//
//  Created by Sean Perez on 5/3/16.
//  Copyright © 2016 Awsome. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectedImg: UIImageView!
    
    let baseURL = "http://localHost:6069/img"
    let missingPeople = ["person1.jpg", "person2.jpg", "person3.jpg", "person4.jpg", "person5.jpg", "person6.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkForMatch(sender: AnyObject) {
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPeople.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCell
        return cell
    }

}

