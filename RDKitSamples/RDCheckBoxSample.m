//
//  RDCheckBoxSample.m
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDCheckBoxSample.h"
#import "RDCheckBox.h"
#import "UIImage+Utils.h"

@interface RDCheckBoxSample ()

@end

@implementation RDCheckBoxSample

+ (NSString*)group
{
    return @"User Interface";
}

+ (NSString*)title
{
    return @"RDCheckBox";
}

+ (NSString*)subtitle
{
    return @"Sample for RDCheckBox";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat yTop = 0;
    
    {
        const CGFloat width = 60;
        RDCheckBox* checkBox = [[RDCheckBox alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - width)/2, yTop + 20, width, width)];
        yTop = checkBox.frame.origin.y + checkBox.frame.size.height;
        checkBox.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        checkBox.backgroundImage = [UIImage stretchableFromCenterImageNamed:@"checkbox_background.png"];
        checkBox.checkmarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        [self.view addSubview:checkBox];
    }
    
    {
        const CGFloat width = 31;
        RDCheckBox* checkBox = [[RDCheckBox alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - width)/2, yTop + 20, width, width)];
        checkBox.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        checkBox.backgroundImage = [UIImage imageNamed:@"checkbox_background.png"];
        checkBox.checkmarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        [self.view addSubview:checkBox];
    }
}

@end
