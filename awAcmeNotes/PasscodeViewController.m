//
//  PasscodeViewController.m
//  awAcmeNotes
//
//  Created by Kevin McKeithan on 8/29/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "PasscodeViewController.h"

@interface PasscodeViewController ()

@end

static NSString *keyedPass = @"●";
static NSString *blankPass = @"_";

@implementation PasscodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)beginConfirmPassword
{
    _isConfirming = YES;
    _confirmPassword = _passcodeTextField.text;
    
    _passcodeTextField.text = @"";
    _passcodeLabel.text = @"Re-enter your passcode";
    
    [self resetPasscodeLabels];
}

-(void)confirmPasscode
{
    _isConfirming = NO;
    if([_passcodeTextField.text isEqualToString:_confirmPassword])
    {
        [[NSUserDefaults standardUserDefaults] setObject:_confirmPassword forKey:@"Passcode"];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passcodes did not match. Try again." delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        _passcodeLabel.text = @"Enter a passcode";
        
        [self resetPasscodeLabels];
    }
}

-(void)resetPasscodeLabels
{
    _passChar1.text = blankPass;
    _passChar2.text = blankPass;
    _passChar3.text = blankPass;
    _passChar4.text = blankPass;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.location > 3)
        return NO;
    
    if(string.length == 0)
    {
        switch (range.location) {
            case 0:
                //
                _passChar1.text = blankPass;
                break;
            case 1:
                _passChar2.text = blankPass;
                break;
            case 2:
                _passChar3.text = blankPass;
                break;
            case 3:
                _passChar4.text = blankPass;
                break;
            default:
                break;
        }
    }
    
    else
    {
        switch (range.location) {
            case 0:
                //
                _passChar1.text = keyedPass;
                break;
            case 1:
                _passChar2.text = keyedPass;
                break;
            case 2:
                _passChar3.text = keyedPass;
                break;
            case 3:
                _passChar4.text = keyedPass;
                break;
            default:
                break;
        }
    }
    
    if(range.location == 3)
    {
        if(_isConfirming)
        {
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
            [self confirmPasscode];
        }
        else if(_isAuthorizing || _isTurningOff)
        {
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
            [self authorize];
        }
        else
        {
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
            [self beginConfirmPassword];
        }
        return NO;
    }
    
    return YES;
}
-(void)authorize
{
    if([_passcodeTextField.text isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"Passcode"]])
    {
        if(_isTurningOff)
        {
            [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"Passcode"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        _isAuthorizing = NO;
        [self resetPasscodeLabels];
        _passcodeTextField.text = @"";
        _passcodeLabel.text = @"Enter a passcode";
    }
    else
    {
        [self resetPasscodeLabels];
        _passcodeTextField.text = @"";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Failed passcode attempt" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
}
-(void)beginAuthorizing
{
    _passcodeLabel.text = @"Enter your old passcode";
    _isAuthorizing = YES;
    _passcodeTextField.text = @"";
    [self resetPasscodeLabels];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self resetPasscodeLabels];
    _passcodeTextField.text = @"";
    
    _isConfirming = NO;
    
    if(_isTurningOff)
    {
        _passcodeLabel.text = @"Enter your old passcode";
    }
    if(_isChanging)
    {
        [self beginAuthorizing];
    }
    
    [_passcodeTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
