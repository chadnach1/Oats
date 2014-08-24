//
//  SignInViewController.h
//  Oats
//
//  Created by Chad Nachiappan on 7/28/14.
//  Copyright (c) 2014 Chad Nachiappan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Constants.h"

@interface SignInViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate>{
    UIPickerView *knumberOf;
    NSMutableArray *pickerData1;
    
    UIPickerView *ksizeOf;
    NSMutableArray *pickerData2;
}

@property (nonatomic, retain) UIPickerView *knumberOf;
@property (nonatomic, retain)  NSArray *pickerData1;

@property (nonatomic, retain) UIPickerView *ksizeOf;
@property (nonatomic, retain)  NSArray *pickerData2;

@property (nonatomic, strong) UITextField *nameText;

@end
