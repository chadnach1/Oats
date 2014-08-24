//
//  ViewController.m
//  Oats
//
//  Created by Chad Nachiappan on 7/28/14.
//  Copyright (c) 2014 Chad Nachiappan. All rights reserved.
//

#import "ViewController.h"

// Supporting Files
#import "UIColor+HexString.h"
#import "FlatButton.h"
#import "SignInViewController.h"
#import "AbstractActionSheetPicker.h"
#import "ActionSheetStringPicker.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Background Color
    self.view.backgroundColor = [UIColor colorWithHexString:kBackgroundColor];
    
    // Navigation Bar Title
    self.navigationItem.title = @"Welcome to Oats";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                    NSFontAttributeName: [UIFont fontWithName:@"Avenir-Black" size:30.0f]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString: kRedColor];
    self.navigationController.navigationBar.translucent = NO;

    // Hide Back button text
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@""
                                      style:UIBarButtonItemStyleBordered
                                     target:nil
                                     action:nil];
    
    
#pragma mark - Tomorrow Date Label
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate * tomorrowDate = [[NSDate alloc] initWithTimeIntervalSinceNow:secondsPerDay];
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM dd, YYYY"];
    
    UILabel * date = [ [UILabel alloc] initWithFrame:CGRectMake(50, 120, 100, 100)];
    
    // Edit tomorrow date label
    date.text = [dateFormat stringFromDate:tomorrowDate];
    date.textColor = [UIColor colorWithHexString: kRegOrangeColor];
    date.font = [UIFont fontWithName: @"Avenir-Black" size:15.0];
    date.lineBreakMode = NSLineBreakByWordWrapping;
    date.numberOfLines = 0;
    date.alpha = 0.0;
    
    date.center = CGPointMake(70, 200);
    
    // Add tomorrow date label to ViewController
    [self.view addSubview:date];
    
#pragma mark - Tomorrow label
    
    // "Tomorrow we're having" label
    UILabel * tomorrow = [ [ UILabel alloc] initWithFrame:CGRectMake(1000, 200, 300, 30)];
    
    // Edit tomorrow label
    tomorrow.text = @"Tomorrow we're having";
    tomorrow.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    tomorrow.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    tomorrow.lineBreakMode = NSLineBreakByWordWrapping;
    tomorrow.numberOfLines = 0;
    
    // Add tomorrow label to ViewController
    [self.view addSubview:tomorrow];
    
#pragma mark - Food List
    
    // Oatmeal label
    UILabel * oatmeal = [ [UILabel alloc] initWithFrame:CGRectMake(600, 250, 300, 50)];
    
    NSArray * oatsList = [NSArray arrayWithObjects:@"Razzmatazz Oats", @"Ban d'Amande Oats", @"Very Berry Oats", @"Apple Rasberry Oats", @"AB'n'J Oats", @"Honey Oats", nil];
    
    NSInteger dayNum = [self whatDay];
    oatmeal.text=[oatsList objectAtIndex:dayNum];
    
    // Edit oatmeal label
    oatmeal.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    oatmeal.font = [UIFont fontWithName: @"Avenir-Black" size:30.0f];
    oatmeal.lineBreakMode = NSLineBreakByWordWrapping;
    oatmeal.numberOfLines = 0;
    
    // Add oatmeal label to ViewController
    [self.view addSubview:oatmeal];
    
    
#pragma mark - Join button
    
    // "Care to join us?" button    
    UIButton * join = [[FlatButton alloc]   initWithFrame:CGRectMake(100, 350, 170, 100)
                                            withBackgroundColor:[UIColor colorWithHexString: kRedColor]];
    join.layer.cornerRadius = 10;
    
    // Edit join button
     join.layer.cornerRadius = 10;
    [join setTitle:@"Care to join us?" forState:UIControlStateNormal];
    join.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [join addTarget:self action:@selector(joinButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    join.alpha = 0.0;
    
    // Add join button to ViewController
    [self.view addSubview: join];
    
#pragma mark - Animations
    
    // Animation 1 - slide the tomorrow label to the left
    [UIView animateWithDuration:1.0f
                        delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                        animations:^ { tomorrow.center = CGPointMake(140, 200); }
                        completion:^(BOOL finished){
                         
    // Animation 2 - slide the tomorrow label slightly to the right
    [UIView animateWithDuration:0.4f
                        delay:0.01f
                        options:UIViewAnimationOptionCurveEaseOut
                        animations:^ { tomorrow.center = CGPointMake(160, 200); }
                        completion:^(BOOL finished) {
       
    // Animation 3 - draw the date out of "Tomorrow"
    [UIView animateWithDuration:1.0f
                        delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction /*| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse*/)
                        animations:^{ date.alpha = 1.0; date.center = CGPointMake(60, 170); }
                     completion:^(BOOL finished) {
                         
    // Amimation 4 - slide the oatmeal list to the right
    [UIView animateWithDuration:1.0f
                        delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction /*| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse*/)
                        animations:^{ oatmeal.center = CGPointMake(220, 230); }
                        completion:nil];

                     }];
                         
    // Animation 5 - fade in the join button
    [UIView animateWithDuration:1.0f
                        delay:1.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut)
                        animations:^{ join.alpha = 1.0; }
                        completion:^(BOOL finished) {
                         
    // Animation 6 - repeat fade out join button
    [UIView animateWithDuration:1.0f
                        delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse)
                        animations:^{ join.alpha = 0.5; }
                        completion:nil];
                                }];
                     
                            }];
                     }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)whatDay {
    
    // Find out what day it is tomorrow, and appropriately select oatmeal
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate * tomorrowDate = [[NSDate alloc] initWithTimeIntervalSinceNow:secondsPerDay];
    NSDateFormatter * dateFormat2 = [[NSDateFormatter alloc] init];
    [dateFormat2 setDateFormat:@"EEE"];
    NSString * dateCheck = [dateFormat2 stringFromDate: tomorrowDate];
    NSLog(dateCheck);
    
    if ([dateCheck isEqualToString:@"Mon"]) return 0;
    else if ([dateCheck isEqualToString:@"Tue"]) return 1;
    else if ([dateCheck isEqualToString:@"Wed"]) return 2;
    else if ([dateCheck isEqualToString:@"Thu"]) return 3;
    else if ([dateCheck isEqualToString:@"Fri"]) return 4;
    else return 5;
    
}

- (IBAction)joinButtonPressed:(id)sender{
    SignInViewController *signIn = [[SignInViewController alloc] init];
    [self.navigationController pushViewController:signIn animated:YES];
    
    NSLog(@"joinButtonPressed");
}

@end
