//
//  RDRadioButtonSample.m
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDRadioButtonSample.h"
#import "RDRadioButton.h"
#import "UIImage+Utils.h"

@interface RDRadioButtonSample ()
{
    UILabel* _selectedRadioButtonLabel;
}
@end


@implementation RDRadioButtonSample

+ (NSString*)group
{
    return @"User Interface";
}

+ (NSString*)title
{
    return @"RDRadioButton";
}

+ (NSString*)subtitle
{
    return @"Sample for RDRadioButton";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat yTop = 0;
    NSString* groupId = @"radiobutton";
    const CGFloat width = 30;
    
    {
        _selectedRadioButtonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, yTop + 20.0f, self.view.bounds.size.width, 30)];
        yTop = _selectedRadioButtonLabel.frame.origin.y + _selectedRadioButtonLabel.frame.size.height;
        _selectedRadioButtonLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
        _selectedRadioButtonLabel.textAlignment = NSTextAlignmentCenter;
        _selectedRadioButtonLabel.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_selectedRadioButtonLabel];
    }
    
    {
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0f, yTop + 20.0f, width, width);
        RDRadioButton* radioButton = [[RDRadioButton alloc] initWithFrame:frame valueId:@"radio button 1" groudId:groupId];
        yTop = radioButton.frame.origin.y + radioButton.frame.size.height;
        radioButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        radioButton.backgroundImage = [UIImage stretchableFromCenterImageNamed:@"checkbox_background.png"];
        radioButton.checkmarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        [radioButton addTarget:self action:@selector(radioButtonSelectionChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:radioButton];
    }
    
    {
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0f, yTop + 20.0f, width, width);
        RDRadioButton* radioButton = [[RDRadioButton alloc] initWithFrame:frame valueId:@"radio button 2" groudId:groupId];
        yTop = radioButton.frame.origin.y + radioButton.frame.size.height;
        radioButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        radioButton.backgroundImage = [UIImage stretchableFromCenterImageNamed:@"checkbox_background.png"];
        radioButton.checkmarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        [radioButton addTarget:self action:@selector(radioButtonSelectionChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:radioButton];
    }
    
    {
        CGRect frame = CGRectMake((self.view.bounds.size.width - width)/2.0f, yTop + 20.0f, width, width);
        RDRadioButton* radioButton = [[RDRadioButton alloc] initWithFrame:frame valueId:@"radio button 3" groudId:groupId];
        yTop = radioButton.frame.origin.y + radioButton.frame.size.height;
        radioButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        radioButton.backgroundImage = [UIImage stretchableFromCenterImageNamed:@"checkbox_background.png"];
        radioButton.checkmarkImage  = [UIImage imageNamed:@"checkbox_checkmark.png"];
        [radioButton addTarget:self action:@selector(radioButtonSelectionChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:radioButton];
    }
}

- (void)radioButtonSelectionChanged:(id)sender
{
    _selectedRadioButtonLabel.text = [(RDRadioButton*)sender valueId];
}

@end
