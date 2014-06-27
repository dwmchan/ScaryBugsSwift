//
//  RWTScaryBugDoc.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 23/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//
import UIKit


class RWTScaryBugDoc {
   
    var data:RWTScaryBugData
    var thumbImage:UIImage
    var fullImage:UIImage
    
    init(title:String, rating:Float, thumbImage:UIImage, fullImage:UIImage) {
        self.data = RWTScaryBugData(title: title, rating: rating)
        self.thumbImage = thumbImage
        self.fullImage = fullImage
    }

}
