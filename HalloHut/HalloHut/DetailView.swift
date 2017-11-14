//
//  DetailView.swift
//  HalloHut
//
//  Created by Devinder Goyal on 2017-11-09.
//  Copyright © 2017 Devinder Goyal. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController, UITextFieldDelegate
{    
    @IBOutlet weak var imgeview_Home: UIImageView!
    @IBOutlet weak var textfield_NoOfCandies: UITextField!
    @IBOutlet weak var textfield_Address: UITextField!
    @IBOutlet weak var imgview_NoOfCandies: UIImageView!
    
    var address : String = ""
    var candies : Int = 0
    var halloweenHomes : String = ""
    var index : NSIndexPath!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "HOUSE DETAIL"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        view.addGestureRecognizer(tapGesture)
        
        textfield_NoOfCandies.delegate = self

        leftbarbutton()
        misc()
    }
    
    @objc func tapBlurButton(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    func misc()
    {
        
        textfield_Address.text = address
        textfield_NoOfCandies.text = String(candies)
        imgeview_Home.image = UIImage(named : halloweenHomes)
        
        if(candies >= 0 && candies <= 1)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon4")
        }
        else if(candies  >= 2 && candies <= 4)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon3")
        }
        else if(candies >= 5 && candies <= 7)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon2")
        }
        else if(candies >= 8)
        {
            imgview_NoOfCandies.image = UIImage(named : "icon1")
        }
    }
    
    func leftbarbutton ()
    {
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
    }
    
    @objc func addTapped()
    {
        self.view.endEditing(true)
        
        if(textfield_NoOfCandies.text?.isEmpty == false || textfield_Address.text?.isEmpty == false)
        {
            let alertController = UIAlertController(title: "Halloween", message: "Save the house?", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) {
                (result : UIAlertAction) -> Void in
                
                ViewController.address[self.index.row] = self.textfield_Address.text!
                ViewController.candies[self.index.row] = Int(self.textfield_NoOfCandies.text!)!
                //ViewController.halloweenHomes.append("home1")
                
                self.navigationController?.popViewController(animated: true)
            })
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }

    @objc func leftButtonTapped()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if(textfield_NoOfCandies.text != nil || textfield_NoOfCandies.text != "")
        {
            if(textfield_NoOfCandies.text?.isEmpty == false)
            {
                if(Int(textfield_NoOfCandies.text!)! >= 0 && Int(textfield_NoOfCandies.text!)! <= 1)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon5")
                }
                else if(Int(textfield_NoOfCandies.text!)! >= 2 && Int(textfield_NoOfCandies.text!)! <= 4)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon4")
                }
                else if(Int(textfield_NoOfCandies.text!)! >= 5 && Int(textfield_NoOfCandies.text!)! <= 7)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon3")
                }
                else if(Int(textfield_NoOfCandies.text!)! >= 8)
                {
                    imgview_NoOfCandies.image = UIImage(named : "icon1")
                }
            }
            else
            {
                imgview_NoOfCandies.image = UIImage(named : "")
            }
        }
        
        return true
    }
}
