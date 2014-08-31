//
//  UIImageExtras.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 28/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageByScalingAndCroppingForSize(targetSize:CGSize) -> UIImage {
        var sourceImage:UIImage = self
        var newImage:UIImage?
        var imageSize:CGSize = sourceImage.size
        var width:CGFloat = imageSize.width
        var height:CGFloat = imageSize.height
        var targetWidth:CGFloat = targetSize.width
        var targetHeight:CGFloat = targetSize.height
        var scaleFactor:CGFloat = 0.0
        var scaledWidth:CGFloat = targetWidth
        var scaledHeight:CGFloat = targetHeight
        var thumbnailPoint:CGPoint = CGPointMake(0.0, 0.0)
        
        if CGSizeEqualToSize(imageSize, targetSize) == false {
            var widthFactor:CGFloat = targetWidth / width
            var heightFactor:CGFloat = targetHeight / height
        
            if widthFactor > heightFactor {
                scaleFactor = widthFactor
            } else {
                scaleFactor = heightFactor
            }
            scaledWidth = ceil(width * scaleFactor)
            scaledHeight = ceil(height * scaleFactor)
            
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            }
            else if widthFactor < heightFactor {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContext(targetSize)
        
        var thumbnailRect:CGRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.drawInRect(thumbnailRect)
        
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        if newImage == nil {
            println("Could not scale image")
        }
        
        UIGraphicsEndImageContext()
        return newImage!
    }
}
