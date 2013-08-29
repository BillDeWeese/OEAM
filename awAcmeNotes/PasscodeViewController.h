//
//  PasscodeViewController.h
//  awAcmeNotes
//
//  Created by Kevin McKeithan on 8/29/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasscodeViewController : UIViewController<UITextFieldDelegate>
{
    
}

@property (weak) IBOutlet UITextField *passcodeTextField;

@property (weak) IBOutlet  UILabel  *passcodeLabel;
@property (weak) IBOutlet  UILabel *passChar1;
@property (weak) IBOutlet  UILabel *passChar2;
@property (weak) IBOutlet  UILabel *passChar3;
@property (weak) IBOutlet  UILabel *passChar4;

@property (assign) BOOL isTurningOff;
@property (assign) BOOL isChanging;
@property (assign) BOOL isConfirming;
@property (assign) BOOL isAuthorizing;
@property (strong, nonatomic) NSString *confirmPassword;

-(void)beginAuthorizing;
-(void)authorize;
-(void)confirmPasscode;
-(void)beginConfirmPassword;
-(void)resetPasscodeLabels;

@end
