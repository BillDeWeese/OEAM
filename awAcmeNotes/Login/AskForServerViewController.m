//
//  AskForServerViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "AskForServerViewController.h"

@interface AskForServerViewController ()
#define kOFFSET_FOR_KEYBOARD 80.0
@end

@implementation AskForServerViewController

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
    
    
    //UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    NSString* fontName = @"Avenir-Black";
    NSString* boldFontName = @"Avenir-BlackOblique";
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0]; //mainColor;
    
    self.serverField.backgroundColor = [UIColor whiteColor];
    self.serverField.placeholder = @"Server Address";
    self.serverField.font = [UIFont fontWithName:fontName size:16.0f];
    self.serverField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.serverField.layer.borderWidth = 1.0f;
    
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 41, 20)];
    self.serverField.leftViewMode = UITextFieldViewModeAlways;
    self.serverField.leftView = leftView;
    
    self.loginButton.backgroundColor = darkColor;
    self.loginButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.loginButton setTitle:@"NEXT" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    [self.loginButton addTarget:self action:@selector(next_onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.titleLabel.textColor =  [UIColor whiteColor];
    self.titleLabel.font =  [UIFont fontWithName:boldFontName size:24.0f];
    self.titleLabel.text = @"ACME NOTES";
    self.titleLabel.hidden = YES;
    
    self.infoLabel.textColor =  [UIColor darkGrayColor];
    self.infoLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
    self.infoLabel.text = @"Enter Server Information.";
    
    self.infoView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    UIColor* imageBorderColor = darkColor;
    self.headerImageView.image = [UIImage imageNamed:@"Cloud"];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.clipsToBounds = YES;
    self.headerImageView.layer.borderWidth = 4.0f;
    self.headerImageView.layer.cornerRadius = 1.0f;
    self.headerImageView.layer.borderColor = imageBorderColor.CGColor;
    
    
    
    self.overlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.3f];
    self.overlayView.hidden = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    NSString *serverAddr =[[NSUserDefaults standardUserDefaults] valueForKey:@"ServerAddr"];
    if (serverAddr) {
        [self.serverField setText:serverAddr];
    }
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}



- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
};


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
};



-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}


//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


-(IBAction)next_onClick:(id)sender{
    
    [[NSUserDefaults standardUserDefaults] setValue:self.serverField.text forKey:@"ServerAddr"];
    [self performSegueWithIdentifier:@"gotoLogin" sender:self];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"showSetup"];
    
};


@end
