//
//  RDCheckBoxSample.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/7/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDCheckBoxSample.h"
#import "RDCheckBox.h"

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
    const CGFloat width = 200;
    const CGFloat height = 80;
    {
        RDCheckBox* checkBox = [[RDCheckBox alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - width)/2, yTop + 20, width, height)];
        yTop = checkBox.frame.origin.y + checkBox.frame.size.height;
        checkBox.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        checkBox.backgroundImage = [UIImage imageNamed:@"checkbox_background.png"];
        checkBox.checkMarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        checkBox.title = @"Checkbox with title at top";
        checkBox.alignment = RDCheckBoxAlignmentLeft;
        [self.view addSubview:checkBox];
    }
    
    {
        RDCheckBox* checkBox = [[RDCheckBox alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - width)/2, yTop + 20, width, height)];
        //под yTop = checkBox.frame.origin.y + checkBox.frame.size.height;
        checkBox.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        checkBox.backgroundImage = [UIImage imageNamed:@"checkbox_background.png"];
        checkBox.checkMarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        checkBox.title = @"Checkbox with title at top";
        checkBox.alignment = RDCheckBoxAlignmentRight;
        [self.view addSubview:checkBox];
    }
}

@end
