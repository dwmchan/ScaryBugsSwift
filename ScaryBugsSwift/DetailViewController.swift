//
//  DetailViewController.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 23/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, RWTRateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var picker:UIImagePickerController = UIImagePickerController()
    var fullImage:UIImage = UIImage()
    var thumbImage:UIImage = UIImage()
    
    @IBOutlet var titleField : UITextField
    @IBOutlet var imageView : UIImageView
    @IBOutlet var rateView : RWTRateView

//    init(picker:UIImagePickerController, fullImage:UIImage, thumbImage:UIImage) {
//        self.picker = picker
//        self.fullImage = fullImage
//        self.thumbImage = thumbImage
//        super.init(nibName: nil, bundle: nil)
//    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail:RWTScaryBugDoc = self.detailItem as? RWTScaryBugDoc {
            if let rv = self.rateView {
                rv.notSelectedImage = UIImage(named: "shockedface2_empty.png")
                rv.halfSelectedImage = UIImage(named: "shockedface2_half.png")
                rv.fullSelectedImage = UIImage(named: "shockedface2_full.png")
                rv.editable = true
                rv.maxRating = 5
                rv.delegate = self /*as RWTRateViewDelegate */
                rv.rating = detail.data.rating!
                self.titleField.text = detail.data.title
                self.imageView.image = detail.fullImage
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
       
        if let detail = self.detailItem as? RWTScaryBugDoc {
            detail.data.rating = rating
        }
    }
    
    @IBAction func addPictureTapped(sender : UIButton) {
        if self.picker == nil {
            self.picker = UIImagePickerController()
            self.picker.delegate = self
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.picker.allowsEditing = false
        }
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        fullImage = info.objectForKey(UIImagePickerControllerOriginalImage) as UIImage
        thumbImage = fullImage.imageByScalingAndCroppingForSize(CGSizeMake(44,44))
        if let detail = self.detailItem as? DetailViewController {
            detail.fullImage = fullImage
            detail.thumbImage = thumbImage
            self.imageView.image = fullImage
        }
    }

    @IBAction func titleFieldTextChanged(sender : UITextField) {
        if let detail = self.detailItem as? RWTScaryBugDoc {
            detail.data.title = self.titleField.text
        }
    }
}



