//
//  RDTextField.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDTextField.h"

@interface RDTextField()
{
    UIImage* __backgroundImage;
    UIImage* __highlightedBackgroundImage;
}
@end


@implementation RDTextField

#pragma mark setters/getters
- (void)setBackground:(UIImage *)background
{
    __backgroundImage = background;
    [self setNeedsLayout];
}

- (void)sethighlightedBackground:(UIImage *)highlightedBackground
{
    __highlightedBackgroundImage = highlightedBackground;
    [self setNeedsLayout];
}

- (void)setTextInsets:(UIEdgeInsets)textInsets
{
    _textInsets = textInsets;
}

#pragma mark initialize
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
    super.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

#pragma mark override
- (CGRect)textRectForBounds:(CGRect)bounds
{
    UIEdgeInsets insets = _textInsets;
    return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], insets);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    UIEdgeInsets insets = _textInsets;
    
    return UIEdgeInsetsInsetRect([super placeholderRectForBounds:bounds], insets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    UIEdgeInsets insets = _textInsets;
    
    return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], insets);
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds
{
    bounds = UIEdgeInsetsInsetRect(bounds, _textInsets);
    CGRect rect = [super clearButtonRectForBounds:bounds];
    rect.origin.x = bounds.origin.x + bounds.size.width - rect.size.width;
    rect.origin.y = bounds.origin.y + (bounds.size.height - rect.size.height)/2;
    return rect;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    bounds = UIEdgeInsetsInsetRect(bounds, _textInsets);
    CGRect rect = [super clearButtonRectForBounds:bounds];
    rect.origin.x = bounds.origin.x;
    rect.origin.y = bounds.origin.y + (bounds.size.height - rect.size.height)/2;
    return rect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    bounds = UIEdgeInsetsInsetRect(bounds, _textInsets);
    CGRect rect = [super clearButtonRectForBounds:bounds];
    rect.origin.x = bounds.origin.x + bounds.size.width - rect.size.width;
    rect.origin.y = bounds.origin.y + (bounds.size.height - rect.size.height)/2;
    return rect;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([self isFirstResponder] && __highlightedBackgroundImage != nil) {
        super.background = __highlightedBackgroundImage;
    } else if (__backgroundImage != nil) {
        super.background = __backgroundImage;
    }
}

@end
