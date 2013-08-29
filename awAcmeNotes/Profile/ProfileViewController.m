//
//  ProfileViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
   
    
    BOOL USE_OEAM = [[NSUserDefaults standardUserDefaults] boolForKey:@"USE_OEAM"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:
                          [[NSBundle mainBundle] pathForResource:@"OEAM_Configuration" ofType:@"plist"]];
    
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    UIColor* imageBorderColor = darkColor;
    
    NSString* fontName = @"Avenir-Book";
    NSString* boldItalicFontName = @"Avenir-BlackOblique";
    NSString* boldFontName = @"Avenir-Black";
  
    self.displayName.textColor =  mainColor;
    self.displayName.font =  [UIFont fontWithName:boldFontName size:18.0f];
    self.displayName.text = @"Bill DeWeese";
    if (USE_OEAM) {self.displayName.text = [dict valueForKeyPath:@"OEAM.User.displayName"];}
    
    
    self.mail.textColor =  mainColor;
    self.mail.font =  [UIFont fontWithName:boldItalicFontName size:14.0f];
    self.mail.text = @"BillDeWeese@air-watch.com";
    if (USE_OEAM) {self.mail.text = [dict valueForKeyPath:@"OEAM.User.mail"];}
    
    
    UIFont *titleLabelFont = [UIFont fontWithName:fontName size:12.0f];
    UIFont *valueLabelFont = [UIFont fontWithName:boldFontName size:14.0f];
    
    self.UID_label.textColor =  mainColor;
    self.UID_label.font =  titleLabelFont;
    self.UID_label.text = @"Username";
    
    
    self.domain_label.textColor =  mainColor;
    self.domain_label.font =  titleLabelFont;
    self.domain_label.text = @"Domain";
    
    
    self.givenName_label.textColor =  mainColor;
    self.givenName_label.font =  titleLabelFont;
    self.givenName_label.text = @"First Name";
    
    
    self.SN_label.textColor =  mainColor;
    self.SN_label.font =  titleLabelFont;
    self.SN_label.text = @"Last Name";
    
    
    self.UID.textColor =  mainColor;
    self.UID.font =  valueLabelFont;
    self.UID.text = @"bdeweese";
    if (USE_OEAM) {self.UID.text = [dict valueForKeyPath:@"OEAM.User.UID"];}
    
    
    self.domain.textColor =  mainColor;
    self.domain.font =  valueLabelFont;
    self.domain.text = @"demo";
    if (USE_OEAM) {self.domain.text = [dict valueForKeyPath:@"OEAM.User.domain"];}
    
    
    self.givenName.textColor =  mainColor;
    self.givenName.font =  valueLabelFont;
    self.givenName.text = @"Bill";
    if (USE_OEAM) {self.givenName.text = [dict valueForKeyPath:@"OEAM.User.givenName"];}
    
    
    self.SN.textColor =  mainColor;
    self.SN.font =  valueLabelFont;
    self.SN.text = @"DeWeese";
    if (USE_OEAM) {self.SN.text = [dict valueForKeyPath:@"OEAM.User.SN"];}
    
    
    self.profileImageView.image = [UIImage imageNamed:@"user.png"];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.cornerRadius = 55.0f;
    self.profileImageView.layer.borderColor = imageBorderColor.CGColor;
    
    
    [self addDividerToView:self.scrollView atLocation:230];
    //[self addDividerToView:self.scrollView atLocation:300];
    //[self addDividerToView:self.scrollView atLocation:370];
    
    self.scrollView.contentSize = CGSizeMake(320, 590);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    
    
}

-(void)addDividerToView:(UIView*)view atLocation:(CGFloat)location{
    
    UIView* divider = [[UIView alloc] initWithFrame:CGRectMake(20, location, 280, 1)];
    divider.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.7f];
    [view addSubview:divider];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
