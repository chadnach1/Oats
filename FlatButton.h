//
//  FlatButton.h
//  Oats
//
//  Created by Chad Nachiappan on 7/28/14.
//  Copyright (c) 2014 Chad Nachiappan. All rights reserved.
//
// Courtesy of https://github.com/ijason/FlatButtons/blob/master/FlatButton.h

#import <UIKit/UIKit.h>

@interface FlatButton : UIButton

@property(strong, nonatomic)UIColor *myColor;

-(id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor;

@end