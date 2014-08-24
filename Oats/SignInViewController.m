//
//  SignInViewController.m
//  Oats
//
//  Created by Chad Nachiappan on 7/28/14.
//  Copyright (c) 2014 Chad Nachiappan. All rights reserved.
//

#import "SignInViewController.h"

// Supporting
#import "FlatButton.h"
#import "UIColor+HexString.h"
#import "ActionSheetStringPicker.h"
#import "AbstractActionSheetPicker.h"


@interface SignInViewController ()

@end

@implementation SignInViewController
@synthesize  knumberOf, pickerData1, ksizeOf, pickerData2, nameText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Background Color
    self.view.backgroundColor = [UIColor colorWithHexString:kBackgroundColor];
    
#pragma mark - Navigation Bar
    
    // Navigation Bar Title
    self.navigationItem.title = @"Confirm Order";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                    NSFontAttributeName: [UIFont fontWithName:@"Avenir-Black" size:26.0f]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:kRedColor];
    self.navigationController.navigationBar.translucent = NO;
    
    // Change back button to white
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

#pragma mark - Quantity Label
    
    // Quantity Label
    UILabel * quantity = [ [ UILabel alloc] initWithFrame:CGRectMake(500, 50, 300, 30)];
    
    // Edit quantity label
    quantity.text = @"How many?";
    quantity.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    quantity.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    quantity.lineBreakMode = NSLineBreakByWordWrapping;
    quantity.numberOfLines = 0;

    // Add quantity label to ViewController
    [self.view addSubview:quantity];
    
#pragma mark - Size Label 
    
    // Size Label
    UILabel * size = [ [ UILabel alloc] initWithFrame:CGRectMake(500, 100, 300, 30)];
    
    // Edit size label
    size.text = @"Size?";
    size.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    size.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    size.lineBreakMode = NSLineBreakByWordWrapping;
    size.numberOfLines = 0;
    
    // Add size label to ViewController
    [self.view addSubview:size];

#pragma mark - Name Label
    
    // Name Label
    UILabel * name = [ [ UILabel alloc] initWithFrame:CGRectMake(500, 150, 300, 30)];
    
    // Edit name label
    name.text = @"Name?";
    name.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    name.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    name.lineBreakMode = NSLineBreakByWordWrapping;
    name.numberOfLines = 0;
    
    // Add name label to ViewController
    [self.view addSubview:name];

#pragma mark - Delivery Label
    
    // Delivery Label
    UILabel * delivery= [ [ UILabel alloc] initWithFrame:CGRectMake(500, 200, 300, 30)];
    
    // Edit delivery label
    delivery.text = @"Delivery:";
    delivery.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    delivery.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    delivery.lineBreakMode = NSLineBreakByWordWrapping;
    delivery.numberOfLines = 0;
    
    // Add delivery label to ViewController
    [self.view addSubview:delivery];
    
#pragma mark - DeliveryTime button
    
    // DeliveryTime button
    //UIButton * deliveryTime= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // Edit delivery button
    //deliveryTime.frame = CGRectMake(200, 400, 300, 300);
    //deliveryTime.titleLabel.text = @"Time?";
    //deliveryTime.titleLabel.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    //deliveryTime.titleLabel.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    //deliveryTime.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //deliveryTime.titleLabel.numberOfLines = 0;
    //[deliveryTime addTarget:self action:@selector(timeButtonPressed:) forControlEvents: UIControlEventTouchUpInside];
    
    // Add delivery time button to ViewController
    //[self.view addSubview:deliveryTime];
    
    // DeliveryTime button
    UIButton *deliveryTime = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // Edit delivery button
    deliveryTime.frame = CGRectMake(10, 240, 300, 35);
    
    [deliveryTime setTitle:@"Time?" forState:UIControlStateNormal];
    [deliveryTime addTarget:self action:@selector(timeButtonPressed:)    forControlEvents:UIControlEventTouchUpInside];
    deliveryTime.titleLabel.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    deliveryTime.titleLabel.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];

    // Add delivery time button to ViewController
    [self.view addSubview: deliveryTime];
    
#pragma mark - DeliveryAddress Label
    
    // DeliveryAddress Label
    UILabel * deliveryAddress = [ [ UILabel alloc] initWithFrame:CGRectMake(500, 260, 300, 30)];
    
    // Edit deliveryAddress label
    deliveryAddress.text = @"Address?";
    deliveryAddress.textColor = [UIColor colorWithHexString: kDarkOrangeColor];
    deliveryAddress.font = [UIFont fontWithName: @"Avenir-Black" size:26.0];
    deliveryAddress.lineBreakMode = NSLineBreakByWordWrapping;
    deliveryAddress.numberOfLines = 0;
    
    // Add deliveryAddress label to ViewController
    [self.view addSubview:deliveryAddress ];

#pragma mark - Name Textfield
    
    // Name textfield
    nameText = [[UITextField alloc] initWithFrame:CGRectMake(500, 150, 150, 30)];
    
    // Edit nameText field
    nameText.placeholder = @"Enter your name";
    nameText.backgroundColor = [UIColor whiteColor];
    
    // http://www.dev-smarter.com/hallo-welt/
    [[nameText layer] setBorderColor:[[UIColor colorWithRed:48/256.0 green:134/256.0 blue:174/256.0 alpha:1.0] CGColor]];
    [[nameText layer] setBorderWidth:2.3];
    [[nameText layer] setCornerRadius:10];
    [nameText setClipsToBounds: YES];
    nameText.textAlignment = NSTextAlignmentCenter;
    nameText.font = [UIFont fontWithName:@"Avenir-Black" size:14.0];
    nameText.adjustsFontSizeToFitWidth = YES;
    nameText.textColor = [UIColor blackColor];
    nameText.returnKeyType = UIReturnKeyDone;
    nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameText.delegate = self;
    

    
    // Add nameText field to ViewController
    [self.view addSubview:nameText];
#pragma mark - Pickerview for quantity
    
    pickerData1= [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",
                 @"5",@"6",@"7",@"8", @"9", @"10", nil];
    
    knumberOf = [[UIPickerView alloc] initWithFrame:CGRectMake(500, -60, 100, 100)];
    knumberOf.showsSelectionIndicator = YES;
    knumberOf.hidden = NO;
    knumberOf.delegate = self;
    
    // Make horizontal
    CGAffineTransform rotate = CGAffineTransformMakeRotation(-3.14/2);
    rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
    [self.knumberOf setTransform:rotate];
    
    // Add quantity pickerview
    [self.view addSubview:knumberOf];
    
#pragma mark - Pickerview for size
    
    pickerData2= [[NSMutableArray alloc] initWithObjects:@"Small",@"Medium",@"Large", nil];
    
    ksizeOf = [[UIPickerView alloc] initWithFrame:CGRectMake(500, -10, 200, 300)];
    ksizeOf.showsSelectionIndicator = YES;
    ksizeOf.hidden = NO;
    ksizeOf.delegate = self;
    
    // Make horizontal
    CGAffineTransform rotate2 = CGAffineTransformMakeRotation(-3.14/2);
    rotate2 = CGAffineTransformScale(rotate, 0.25, 2.0);
    [self.ksizeOf setTransform:rotate];
    
    // Add size pickerview
    [self.view addSubview:ksizeOf];
    
#pragma mark - Pickerview for deliveryTime
    
    //UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 325, 300)];
    //datePicker.datePickerMode = UIDatePickerModeTime;
    
    
    /*[ActionSheetDatePicker      showPickerWithTitle: @"Delivery time here"
                                datePickerMode: UIDatePickerModeTime
                                selectedDate: [NSDate date]
                                target: nil
                                action: nil
                                origin: self.view];*/
     
     
    //[self.view addSubview:datePicker];
    
#pragma mark - Animations
    
    // Animation 1 - slide the quantity label to the left
    [UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ { quantity.center = CGPointMake(160, 50); }
                     completion:^ (BOOL finished) {
    
    // Animation 2 - slide the size label to the left
    [UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ { size.center = CGPointMake(160, 100); }
                     completion:^ (BOOL finished) {
                         
    //Animation 3 - slide the name label to the left
    [UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                    animations:^ { name.center = CGPointMake(160, 150); }
                    completion: ^ (BOOL finished) {
    
    // Animation 4 - slide the delivery label to the left
    [UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                    animations:^ { delivery.center = CGPointMake(160, 200); }
                    completion:^ (BOOL finished) {
                         
    // Animation 5 - slide deliveryTime label to the left
    /*[UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ { deliveryTime.center = CGPointMake(100, 240); }
                     completion: ^ (BOOL finished) {*/
                         
    // Animation 6 - slide deliveryAddress label to the left
    [UIView animateWithDuration:0.4f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ { deliveryAddress.center = CGPointMake(200, 280); }
                     completion:nil];

    // Animation 7 - slide quantity pickerview to the left
    [UIView animateWithDuration:0.55f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                    animations:^ { knumberOf.center = CGPointMake(250, 50); }
                    completion:^ (BOOL finished) {
                                              
    // Animation 8 - slide size pickerview to the left
    [UIView animateWithDuration:0.5f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ { ksizeOf.center = CGPointMake(250, 100); }
                     completion:^ (BOOL finished) {
                         
    // Animation 9 - slide nameText field to the left
    [UIView animateWithDuration:0.5f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                    animations:^ { nameText.center = CGPointMake(240, 150); }
                    completion:nil];
                                        //}];
                                        }];
                                        }];
                                        }];
                                        }];
                                        }];
                                        }];

                        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) timeButtonPressed:(NSString *)myString{
    NSArray *timeOptions= [NSArray arrayWithObjects:@"7:00 - 7:15 AM", @"7:15 - 7:30 AM", @"7:30 - 7:45 AM", @"7:45 - 8:00 AM", @"8:00 - 8:15 AM", @"8:15 - 8:30 AM", @"8:30 - 8:45 AM",@"8:45 - 9:00 AM",@"9:00 - 9:15 AM",@"9:15 - 9:30 AM",@"9:30 - 9:45 AM",@"9:45 - 10:00 AM",@"10:00 - 10:15 AM",@"10:15 - 10:30 AM",@"10:30 - 10:45 AM",@"10:45 - 11:00 AM",  nil];
    
    [ActionSheetStringPicker showPickerWithTitle:@"Delivery Time Window"
                                            rows:timeOptions
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           //NSLog(@"Picker: %@", picker);
                                           //NSLog(@"Selected Index: %@", selectedIndex);
                                           //NSLog(@"Selected Value: %@", selectedValue);
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                         NSLog(@"Block Picker Canceled");
                                     }
                                          origin:self.view];
}

#pragma mark - Pickerview methods

//Columns in picker views
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}

//Rows in each Column
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    if (pickerView == self.knumberOf)
        return 10;
    else
        return 3;
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{   if (pickerView == self.knumberOf)
        return [pickerData1 objectAtIndex:row];
    else
        return [pickerData2 objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    //Write the required logic here that should happen after you select a row in Picker View.
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    CGRect rect = CGRectMake(0, 0, 120, 80);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    CGAffineTransform rotate = CGAffineTransformMakeRotation(3.14/2);
    rotate = CGAffineTransformScale(rotate, 0.25, 2.0);
    [label setTransform:rotate];
    if (pickerView == self.knumberOf) {
        label.text = [pickerData1 objectAtIndex:row];
        label.font = [UIFont fontWithName: @"Avenir-Black" size:40.0];
    }
    if (pickerView == self.ksizeOf) {
        label.text = [pickerData2 objectAtIndex:row];
        label.font = [UIFont fontWithName: @"Avenir-Black" size:31.3];
        //pickerView.transform = CGAffineTransformMakeScale(.5, 0.5);
    }
    
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 2;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.backgroundColor = [UIColor clearColor];
    label.clipsToBounds = YES;
    return label ;
}

#pragma mark - Hide keyboard for UITextField 

// http://looksok.wordpress.com/2013/02/02/ios-tutorial-hide-keyboard-after-return-done-key-press-in-uitextfield/

// Hide keyboard on Done
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.nameText) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

// Hide keyboard on exterior tap

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
