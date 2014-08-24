//
//  UIColor+HexString.h
//  Oats
//
//  Created by Chad Nachiappan on 7/28/14.
//  Copyright (c) 2014 Chad Nachiappan. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
//
// NO license specififed
//


@interface UIColor (HexString)

+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

@end