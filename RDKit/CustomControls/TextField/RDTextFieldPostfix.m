//
//  RDTextFieldPostfix.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "RDTextFieldPostfix.h"

@interface RDTextFieldPostfix()

@property (nonatomic, retain) UILabel* postfixLabel;
@property (nonatomic, retain) UILabel* postfixPlaceholderLabel;

- (void)initialize;
- (void)updatePostfixFrame;

@end


@implementation RDTextFieldPostfix

#pragma mark - setters

#pragma mark - initialize
- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    
}

#pragma mark layout
- (void)updatePostfixFrame
{
    
}

@end
