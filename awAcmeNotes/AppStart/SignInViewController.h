//
//  SignInViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UITableViewController <UIAlertViewDelegate, UITextFieldDelegate>


@property (nonatomic, weak) IBOutlet UITableViewCell *DomainCell;
@property (nonatomic, weak) IBOutlet UITextField *Domain_TextField;
@property (nonatomic, weak) IBOutlet UITextField *Username_TextField;
@property (nonatomic, weak) IBOutlet UITextField *Password_TextField;


-(IBAction)cancel_onClick:(id)sender;
-(IBAction)signIn_onClick:(id)sender;


@end
