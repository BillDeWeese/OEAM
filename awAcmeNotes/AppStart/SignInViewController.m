//
//  SignInViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

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

    self.DomainCell.hidden = YES;
    self.Domain_TextField.enabled = NO;
    
    [self setNextWizardButton];
    
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




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    [self setNextWizardButton];
  
    return YES;
}

-(void)setNextWizardButton{
  
    
    if (self.Password_TextField.text.length == 0 || self.Username_TextField.text.length == 0) {

        self.navigationItem.rightBarButtonItem = nil;
    
    }else{
        
        NSString *key = [NSString stringWithFormat:@"%@_%@",self.Username_TextField.text, @"didVisitSettings" ];
        
        if ([[NSUserDefaults standardUserDefaults] valueForKey:key] == nil) {
            [self showNextButton];
        }else{
            [self showSignInButton];
        }
        
    }
    
}


-(void)showNextButton{

    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(signIn_onClick:)];
    
    self.navigationItem.rightBarButtonItem = menuItem;
    
}

-(void)showSignInButton{


     UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign in"
         style:UIBarButtonItemStylePlain
         target:self
         action:@selector(signIn_onClick:)];
         
     self.navigationItem.rightBarButtonItem = menuItem;
    
}



-(IBAction)cancel_onClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
};

-(IBAction)signIn_onClick:(id)sender{
   [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"login_Success" object: nil] postingStyle: NSPostNow];
};

-(IBAction)next_onClick:(id)sender{
    [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"login_Success" object: nil] postingStyle: NSPostNow];
};






@end
