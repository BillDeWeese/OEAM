//
//  PasswordViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "PasswordViewController.h"
#import "PasscodeViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:NO];
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"Passcode"] != nil)
    {
        //_setPasscodeButton.enabled = NO;

        [_setPasscodeButton setTitle:@"Turn Passcode Off" forState:UIControlStateNormal];
        //_setPasscodeButton.titleLabel.text = @"Turn Passcode Off";
        
        _changePasscodeButton.enabled = YES;
    }
    else
    {
        _setPasscodeButton.enabled = YES;
        [_setPasscodeButton setTitle:@"Turn Passcode On" forState:UIControlStateNormal];
        
        _changePasscodeButton.enabled = NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PasscodeViewController *viewController = [segue destinationViewController];
    if([segue.identifier isEqualToString:@"setPasscode"])
    {
        viewController.isChanging = NO;
        
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"Passcode"] != nil)
            viewController.isTurningOff = YES;
        else
            viewController.isTurningOff = NO;
    }
    else if([segue.identifier isEqualToString:@"changePasscode"])
    {
        viewController.isChanging = YES;
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
