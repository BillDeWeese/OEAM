//
//  ProfileViewController.h
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController{

}


@property (nonatomic, weak) IBOutlet UIImageView* profileImageView;
@property (nonatomic, weak) IBOutlet UIView* overlayView;

@property (nonatomic, weak) IBOutlet UILabel* displayName;
@property (nonatomic, weak) IBOutlet UILabel* mail;

@property (nonatomic, weak) IBOutlet UILabel* UID_label;
@property (nonatomic, weak) IBOutlet UILabel* domain_label;
@property (nonatomic, weak) IBOutlet UILabel* givenName_label;
@property (nonatomic, weak) IBOutlet UILabel* SN_label;

@property (nonatomic, weak) IBOutlet UILabel* UID;
@property (nonatomic, weak) IBOutlet UILabel* domain;
@property (nonatomic, weak) IBOutlet UILabel* givenName;
@property (nonatomic, weak) IBOutlet UILabel* SN;



@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;



@end
