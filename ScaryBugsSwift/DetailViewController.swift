//
//  DetailViewController.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 23/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, RWTRateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let picker:UIImagePickerController
        
    
    @IBOutlet var titleField : UITextField
    @IBOutlet var imageView : UIImageView
    @IBOutlet var rateView : RWTRateView

    
    init(picker:UIImagePickerController!) {
        self.picker = picker
    }
    
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
                rv.delegate = self as RWTRateViewDelegate
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
    
    func rateView(rateView:RWTRateView!, ratingDidChange rating:Float!) ->Void {
       
        if let detail = self.detailItem as? RWTScaryBugDoc {
            detail.data.rating = rating
        }
    }

    @IBAction func addPictureTapped(sender : UIButton) {
    }

    @IBAction func titleFieldTextChanged(sender : UITextField) {
        if let detail = self.detailItem as? RWTScaryBugDoc {
            detail.data.title = self.titleField.text
        }
    }
}



