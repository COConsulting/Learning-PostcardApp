//
//  ViewController.swift
//  Postcard
//
//  Created by Work on 2/5/15.
//  Copyright (c) 2015 COCGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterRecipientName: UITextField!
    @IBOutlet weak var enterMessageTextField: UITextField!
    @IBOutlet weak var stampIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipientLabel: UILabel!
    @IBOutlet weak var nameErrorIndicator: UILabel!
    @IBOutlet weak var recipientErrorIndicator: UILabel!
    @IBOutlet weak var messageErrorIndicator: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var clearAllBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clearAllBtn(sender: UIButton) {
        //Make sure that all hidden objects are hidden
        nameErrorIndicator.hidden=true
        recipientErrorIndicator.hidden=true
        messageErrorIndicator.hidden=true
        errorLabel.hidden=true
        messageLabel.hidden=true
        stampIcon.hidden=true
        nameLabel.hidden=true
        recipientLabel.hidden=true
        
        //Clear All fields
        enterNameTextField.text=""
        enterRecipientName.text=""
        enterMessageTextField.text=""
        
        //Reset Buttons to default state
        mailButton.backgroundColor = UIColor.blueColor()
        mailButton.setTitle("Send Mail", forState: UIControlState.Normal)
    }
    
    @IBAction func sendMailButtonPressed(sender: UIButton) {
        
        //Make sure that all hidden objects are hidden
        nameErrorIndicator.hidden=true
        recipientErrorIndicator.hidden=true
        messageErrorIndicator.hidden=true
        errorLabel.hidden=true
        messageLabel.hidden=true
        stampIcon.hidden=true
        nameLabel.hidden=true
        recipientLabel.hidden=true
        
        if(enterNameTextField.text=="" || enterRecipientName.text=="" || enterMessageTextField.text==""){

            errorLabel.hidden=false
            errorLabel.text="Please correct the missing information above."
            
            mailButton.setTitle("Retry Send", forState: UIControlState.Normal)
            mailButton.backgroundColor = UIColor.redColor()
            
            if(enterNameTextField.text==""){
//              nameLabel.textColor = UIColor.redColor()
//              nameLabel.text="Please Enter Your Name"
                nameErrorIndicator.hidden=false
            }
            
            if(enterRecipientName.text==""){
//              recipientLabel.textColor = UIColor.redColor()
//              recipientLabel.text="Please Enter Recipient's Name"
                recipientErrorIndicator.hidden=false
            }
            
            if(enterMessageTextField.text==""){
//              messageLabel.textColor = UIColor.redColor()
//              messageLabel.text="No Message Entered"
                messageErrorIndicator.hidden=false
            }
            
        }else{
            messageLabel.hidden=false
            stampIcon.hidden=false
            nameLabel.hidden=false
            recipientLabel.hidden=false
            
            nameErrorIndicator.hidden=true
            nameLabel.text="From: " + enterNameTextField.text
            nameLabel.textColor = UIColor.blueColor()
            enterNameTextField.text=""

            recipientErrorIndicator.hidden=true
            recipientLabel.text="To: " + enterRecipientName.text
            recipientLabel.textColor = UIColor.blueColor()
            enterRecipientName.text=""

            messageErrorIndicator.hidden=true
            messageLabel.text=enterMessageTextField.text
            messageLabel.textColor = UIColor.blueColor()
            enterMessageTextField.text=""
            
            mailButton.setTitle("Mail Sent", forState: UIControlState.Normal)
            mailButton.backgroundColor = UIColor.greenColor()
            
        }
        
        enterMessageTextField.resignFirstResponder()
        enterNameTextField.resignFirstResponder()
        enterRecipientName.resignFirstResponder()
    }

}

