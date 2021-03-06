//
//  MenuCell.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/26/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if(selected){
        self.bgView.backgroundColor = self.mainColor;
    }
    else{
        self.bgView.backgroundColor = self.darkColor;
    }
    
}

-(void)awakeFromNib{
    
    self.mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    self.darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    self.bgView.backgroundColor = self.darkColor;
    
    self.topSeparator.backgroundColor = [UIColor clearColor];
    self.bottomSeparator.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.2f];
    
    NSString* boldFontName = @"Avenir-Black";
    
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont fontWithName:boldFontName size:14.0f];
    
    self.countLabel.textColor = [UIColor whiteColor];
    self.countLabel.backgroundColor = self.mainColor;
    self.countLabel.font = [UIFont fontWithName:boldFontName size:14.0f];
    
    self.countLabel.layer.cornerRadius = 3.0f;
}

@end
