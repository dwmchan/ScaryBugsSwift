//
//  DetailViewController.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 23/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, RWTRateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //var picker:UIImagePickerController = UIImagePickerController()

    //var picker = UIImagePickerController()

//    var fullImage:UIImage = UIImage()
//    var thumbImage:UIImage = UIImage()
    
    @IBOutlet var titleField : UITextField
    @IBOutlet var imageView : UIImageView
    @IBOutlet var rateView : RWTRateView

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail:RWTScaryBugDoc = detailItem as? RWTScaryBugDoc {
            if let rv = self.rateView {
                rv.notSelectedImage = UIImage(named: "shockedface2_empty.png")
                rv.halfSelectedImage = UIImage(named: "shockedface2_half.png")
                rv.fullSelectedImage = UIImage(named: "shockedface2_full.png")
                rv.editable = true
                rv.maxRating = 5
                rv.delegate = self /*as RWTRateViewDelegate */
                rv.rating = detail.data.rating!
                titleField.text = detail.data.title
                imageView.image = detail.fullImage
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func rateView(rateView:RWTRateView!, ratingDidChange rating:Float) -> Void {
       
        if let detail = detailItem as? RWTScaryBugDoc {
            detail.data.rating = rating
        }
    }
    
    @IBAction func addPictureTapped(sender : UIButton) {
        var picker = UIImagePickerController()
        
//        if picker == nil {
            //picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            picker.allowsEditing = false
//        }
        presentViewController(picker, animated: true, completion: nil)
    }
    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
//        var thumbImage:UIImage = image.imageByScalingAndCroppingForSize(CGSizeMake(44, 44))
//        if let detail = detailItem as? RWTScaryBugDoc {
//            detail.fullImage = image
//            detail.thumbImage = thumbImage
//            imageView.image = image
//        }
//        dismissViewControllerAnimated(true, completion: nil)
//    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!) {
        var fullImage:UIImage = info.objectForKey(UIImagePickerControllerOriginalImage) as UIImage
        var thumbImage:UIImage = fullImage.imageByScalingAndCroppingForSize(CGSizeMake(44,44)) as UIImage
        if let detail = detailItem as? RWTScaryBugDoc {
            detail.fullImage = fullImage
            detail.thumbImage = thumbImage
            imageView.image = fullImage
        }
        
         dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    

    @IBAction func titleFieldTextChanged(sender : UITextField) {
        if let detail = detailItem as? RWTScaryBugDoc {
            detail.data.title = titleField.text
        }
    }
}



