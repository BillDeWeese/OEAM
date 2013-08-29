//
//  SettingsViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/28/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationItem setHidesBackButton:YES];
    
    int selectedLogLevel = [[[NSUserDefaults standardUserDefaults] valueForKey:@"LogLevel"] integerValue];
    if (selectedLogLevel == 0) {
        [self.Logging.detailTextLabel setText:@"Off"];
    }else{
        [self.Logging.detailTextLabel setText:@"On"];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)finish_onClick:(id)sender{
    [[NSNotificationQueue defaultQueue] enqueueNotification: [NSNotification notificationWithName: @"login_Success" object: nil] postingStyle: NSPostNow];
};


@end