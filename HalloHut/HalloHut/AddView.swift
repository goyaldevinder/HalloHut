//
//  AddView.swift
//  HalloHut
//
//  Created by Devinder Goyal on 2017-11-09.
//  Copyright © 2017 Devinder Goyal. All rights reserved.
//

import Foundation
import UIKit

class AddView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var imgview_Home: UIImageView!
    @IBOutlet weak var textfield_Address: UITextField!
    @IBOutlet weak var textfield_NoOfCandies: UITextField!
    @IBOutlet weak var imgview_Emotions: UIImageView!
    
    var address : [String] = []
    var candies : [Int] = []
    var halloweenHomes : [String] = []

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ADD NEW HOUSE"
        
        print("Count \(address.count) \(candies.count) \(halloweenHomes.count)")
        
        misc()
    }
    
    func misc()
    {
        //Misc
        textfield_NoOfCandies.delegate = self
        imgview_Home.isUserInteractionEnabled = true
        imagePicker.delegate = self
        //Ends
        
        //Left bar button item
        let leftButton : UIBarButtonItem = UIBarButtonItem(title: "BACK", style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftButtonTapped))
        leftButton.tintColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = leftButton
        //Ends
        
        //Right bar button item
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "SAVE", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addTapped))
        logButton.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = logButton
        //Ends
        
        //Getures
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        let tapGestureForImage = UITapGestureRecognizer(target: self, action: #selector(self.tapHomeImage(_:)))
        
        view.addGestureRecognizer(tapGesture)
        imgview_Home.addGestureRecognizer(tapGestureForImage)
        //Ends
    }
    
    @objc func leftButtonTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addTapped()
    {
        self.view.endEditing(true)
        
        if(textfield_NoOfCandies.text?.isEmpty == false || textfield_Address.text?.isEmpty == false)
        {
            let alertController = UIAlertController(title: "Halloween", message: "Yes! To Save the house", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) {
                (result : UIAlertAction) -> Void in
                
                ViewController.address.append(self.textfield_Address.text!)
                ViewController.candies.append(Int(self.textfield_NoOfCandies.text!)!)
                ViewController.halloweenHomes.append("house1")
                            
                print("After Count \(self.address.count) \(self.candies.count) \(self.halloweenHomes.count)")
                self.navigationController?.popViewController(animated: true)
            })
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func tapBlurButton(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @objc func tapHomeImage(_ sender: UITapGestureRecognizer)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //Imagepicker method starts
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let fetchImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgview_Home.image = fetchImage
        dismiss(animated:true, completion: nil)
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //Imagepicked method ends
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if(textfield_NoOfCandies.text != nil || textfield_NoOfCandies.text != "")
        {
            if(textfield_NoOfCandies.text?.isEmpty == false)
            {
                if(Int(textfield_NoOfCandies.text!)! >= 0 && Int(textfield_NoOfCandies.text!)! <= 1)
                {
                    imgview_Emotions.image = UIImage(named : "icon4")
                }
                else if(Int(textfield_NoOfCandies.text!)! >= 2 && Int(textfield_NoOfCandies.text!)! <= 4)
                {
                    imgview_Emotions.image = UIImage(named : "icon3")
                }
                else if(Int(textfield_NoOfCandies.text!)! >= 5 && Int(textfield_NoOfCandies.text!)! <= 7)
                {
                    imgview_Emotions.image = UIImage(named : "icon2")
                }
                else if(Int(textfield_NoOfCandies.text!)! >= 5 && Int(textfield_NoOfCandies.text!)! <= 7)
                {
                    imgview_Emotions.image = UIImage(named : "icon1")
                }
            }
            else
            {
                imgview_Emotions.image = UIImage(named : "")
            }
        }
        
        return true
    }
}
