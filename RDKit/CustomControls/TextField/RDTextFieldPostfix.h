//
//  RDTextFieldPostfix.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDTextField.h"


typedef NS_ENUM(NSInteger, RDPostfixVerticalAlignment) {
    RDPostfixVerticalAlignmentTop = 0,
    RDPostfixVerticalAlignmentCenter,
    RDPostfixVerticalAlignmentBottom
};

@interface RDTextFieldPostfix : RDTextField

@property (nonatomic, assign) RDPostfixVerticalAlignment postfixAlignment;
@property (nonatomic, strong) UIFont*   postfixFont;

@property (nonatomic, strong) NSString* postfix;
@property (nonatomic, strong) UIColor*  postfixColor;

@property (nonatomic, strong) NSString* postfixPlaceholder;
@property (nonatomic, strong) UIColor*  postfixPlaceholderColor;

@end
