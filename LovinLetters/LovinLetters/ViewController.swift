//
//  ViewController.swift
//  LovinLetters
//
//  Created by Travis Baker on 10/2/14.
//  Copyright (c) 2014 Travis Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginView: FBLoginView = FBLoginView()
        loginView.delegate = self
        
        //Centers the button horizontally, and 3/4 of the way down the page vertically
        loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), (self.view.frame.height / 4 * 3 - (loginView.frame.size.height / 2)))
        view.addSubview(loginView)
        
        loginView.readPermissions = ["public_profile", "email", "user_friends"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        //TODO: Implement this function
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        //Implement this method too.
    }

    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        //Stub code. Implement later.
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        var alertTitle: String
        var alertMessage: String
        
        if (FBErrorUtility.shouldNotifyUserForError(error)) {
            alertTitle = "Facebook Error"
            alertMessage = FBErrorUtility.userMessageForError(error)
        } else {
            alertTitle = "Something went wrong"
            alertMessage = "Please try again later"
        }
        
        if (alertMessage.isEmpty) {
            let alertView = UIAlertView()
            alertView.title = alertTitle
            alertView.message = alertMessage
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
    }
}

