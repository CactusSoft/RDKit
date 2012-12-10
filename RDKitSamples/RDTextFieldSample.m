//
//  RDTextFieldSample.m
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDTextFieldSample.h"
#import "RDTextField.h"
#import "RDTextFieldPostfix.h"
#import "UIImage+Utils.h"

@interface RDTextFieldSample ()<UITextFieldDelegate>

@end

@implementation RDTextFieldSample

+ (NSString*)group
{
    return @"User Interface";
}

+ (NSString*)title
{
    return @"RDTextField";
}

+ (NSString*)subtitle
{
    return @"Sample for RDTextField family classes";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    const CGFloat width = 200;
    CGFloat yTop = 0;
    
    {
        UIImage* image = [UIImage stretchableFromCenterImageNamed:@"field.png"];
        UIImage* imageHighlighted = [UIImage stretchableFromCenterImageNamed:@"field_highlighted.png"];
        
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0, yTop + 20, width, 34);
        yTop = frame.origin.y + frame.size.height;
        RDTextField* textField = [[RDTextField alloc] initWithFrame:CGRectIntegral(frame)];
        textField.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.background = image;
        textField.inputBackground = imageHighlighted;
        textField.textInsets = UIEdgeInsetsMake(8, 7, 8, 7);
        textField.delegate = self;
        textField.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:textField];
    }
    
    {
        UIImage* image = [UIImage stretchableFromCenterImageNamed:@"field.png"];
        UIImage* imageHighlighted = [UIImage stretchableFromCenterImageNamed:@"field_highlighted.png"];
        
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0, yTop + 20, width, 27);
        yTop = frame.origin.y + frame.size.height;
        RDTextField* textField = [[RDTextField alloc] initWithFrame:CGRectIntegral(frame)];
        textField.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.background = image;
        textField.inputBackground = imageHighlighted;
        textField.textInsets = UIEdgeInsetsMake(6, 5, 6, 4);
        textField.delegate = self;
        textField.font = [UIFont systemFontOfSize:12];
        [self.view addSubview:textField];
    }
    
    {
        UIImage* image = [UIImage imageNamed:@"field_dashed.png"];
        UIImage* imageHighlighted = [UIImage imageNamed:@"field_dashed_highlighted.png"];
        
        CGRect frame = CGRectMake((self.view.bounds.size.width-image.size.width)/2, yTop + 20, image.size.width, image.size.height);
        yTop = frame.origin.y + frame.size.height;
        RDTextField* textField = [[RDTextField alloc] initWithFrame:CGRectIntegral(frame)];
        textField.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.background = image;
        textField.inputBackground = imageHighlighted;
        textField.textInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        textField.delegate = self;
        textField.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:textField];
    }
    
    {
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0, yTop + 20, width, 34);
        yTop = frame.origin.y + frame.size.height;
        RDTextFieldPostfix* textField = [[RDTextFieldPostfix alloc] initWithFrame:CGRectIntegral(frame)];
        textField.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.background = [UIImage stretchableFromCenterImageNamed:@"field.png"];
        textField.textInsets = UIEdgeInsetsMake(8, 7, 8, 7);
        textField.delegate = self;
        textField.font = [UIFont systemFontOfSize:16];
        textField.postfixFont = [UIFont systemFontOfSize:8];
        textField.postfixAlignment = RDPostfixVerticalAlignmentTop;
        textField.postfix = @"©";
        textField.postfixPlaceholder = @"©";
        textField.postfixPlaceholderColor = [UIColor grayColor];
        textField.placeholder = @"Top aligned postfix";
        
        [self.view addSubview:textField];
    }
    
    {
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0, yTop + 20, width, 34);
        //yTop = frame.origin.y + frame.size.height;
        RDTextFieldPostfix* textField = [[RDTextFieldPostfix alloc] initWithFrame:CGRectIntegral(frame)];
        textField.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.background = [UIImage stretchableFromCenterImageNamed:@"field.png"];
        textField.textInsets = UIEdgeInsetsMake(8, 7, 8, 7);
        textField.delegate = self;
        textField.font = [UIFont systemFontOfSize:16];
        textField.postfixFont = [UIFont systemFontOfSize:16];
        textField.postfixAlignment = RDPostfixVerticalAlignmentBottom;
        textField.postfix = @"H®";
        textField.postfixPlaceholder = @"®";
        textField.postfixPlaceholderColor = [UIColor grayColor];
        textField.placeholder = @"Bottom aligned postfix";
        
        [self.view addSubview:textField];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
