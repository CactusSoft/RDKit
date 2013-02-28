//
//  RDTextFieldPostfix.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDTextFieldPostfix.h"

@interface RDTextFieldPostfix()
{
    CGFloat _postfixSpace;
    CGFloat _postfixPlaceholderSpace;
}

@property (nonatomic, strong) UILabel* postfixLabel;
@property (nonatomic, strong) UILabel* postfixPlaceholderLabel;

- (void)initialize;
- (void)layoutPostfix;

@end


@implementation RDTextFieldPostfix

#pragma mark setters/getters
- (void)setPostfixAlignment:(RDPostfixVerticalAlignment)postfixAlignment
{
    _postfixAlignment = postfixAlignment;
    [self layoutPostfix];
}

- (void)setPostfix:(NSString *)postfix
{
    self.postfixLabel.text = postfix;
    [self layoutPostfix];
}

- (NSString *)postfix
{
    return self.postfixLabel.text;
}

- (void)setPostfixColor:(UIColor *)postfixColor
{
    self.postfixLabel.textColor = postfixColor;
}

- (UIColor *)postfixColor
{
    return self.postfixLabel.textColor;
}

- (void)setPostfixFont:(UIFont *)postfixFont
{
    self.postfixLabel.font = postfixFont;
    self.postfixPlaceholderLabel.font = postfixFont;
    [self layoutPostfix];
}

- (UIFont *)postfixFont
{
    return self.postfixLabel.font;
}

- (void)setPostfixPlaceholder:(NSString *)postfixPlaceholder
{
    self.postfixPlaceholderLabel.text = postfixPlaceholder;
    [self layoutPostfix];
}

- (NSString *)postfixPlaceholder
{
    return self.postfixPlaceholderLabel.text;
}

- (void)setPostfixPlaceholderColor:(UIColor *)postfixPlaceholderColor
{
    self.postfixPlaceholderLabel.textColor = postfixPlaceholderColor;
}

- (UIColor *)postfixPlaceholderColor
{
    return self.postfixPlaceholderLabel.textColor;
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
    _postfixSpace = 0.0f;;
    _postfixPlaceholderSpace = 0.0f;
    
    self.postfixLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.postfixLabel.backgroundColor = [UIColor clearColor];
    self.postfixLabel.font = self.font;
    self.postfixLabel.textColor = self.textColor;
    [self addSubview:self.postfixLabel];
    
    self.postfixPlaceholderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.postfixPlaceholderLabel.backgroundColor = [UIColor clearColor];
    self.postfixPlaceholderLabel.font = self.font;
    self.postfixPlaceholderLabel.textColor = self.textColor;
    [self addSubview:self.postfixPlaceholderLabel];
    
    self.postfixAlignment = RDPostfixVerticalAlignmentCenter;
}

#pragma mark layout
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super textRectForBounds:bounds];
    textRect.size.width -= self.postfixLabel.frame.size.width + _postfixSpace;
    return textRect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super editingRectForBounds:bounds];
    textRect.size.width -= self.postfixLabel.frame.size.width + _postfixSpace;
    return textRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super editingRectForBounds:bounds];
    textRect.size.width -= self.postfixPlaceholderLabel.frame.size.width + _postfixPlaceholderSpace;
    return textRect;
}

- (void)layoutPostfix
{
    [self.postfixLabel sizeToFit];
    _postfixSpace = self.postfixLabel.text.length > 0 ? [@" " sizeWithFont:self.postfixLabel.font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].width/2 : 0;
    
    [self.postfixPlaceholderLabel sizeToFit];
    _postfixPlaceholderSpace = self.postfixPlaceholderLabel.text.length > 0 ? [@" " sizeWithFont:self.postfixPlaceholderLabel.font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].width/2 : 0;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect  textRect;
    CGFloat stringWidth;
    CGRect  postfixRect;
    UIFont* postfixFont = nil;
    CGFloat postfixSpace = 0;
    
    if (self.text.length > 0) {
        textRect = [self textRectForBounds:self.bounds];
        stringWidth = [self.text sizeWithFont:self.font forWidth:textRect.size.width lineBreakMode:NSLineBreakByTruncatingTail].width;
        postfixRect = self.postfixLabel.frame;
        postfixFont = self.postfixLabel.font;
        postfixSpace = _postfixSpace;
    } else {
        textRect = [self placeholderRectForBounds:self.bounds];
        stringWidth = [self.placeholder sizeWithFont:self.font forWidth:textRect.size.width lineBreakMode:NSLineBreakByTruncatingTail].width;
        postfixRect = self.postfixPlaceholderLabel.frame;
        postfixFont = self.postfixPlaceholderLabel.font;
        postfixSpace = _postfixPlaceholderSpace;
    }
    
    switch (self.textAlignment) {
        case NSTextAlignmentCenter: {
            postfixRect.origin.x = textRect.origin.x + stringWidth/2 + textRect.size.width/2 + postfixSpace;
        } break;
        case NSTextAlignmentLeft: {
            postfixRect.origin.x = textRect.origin.x + stringWidth + postfixSpace;
        } break;
        case NSTextAlignmentRight: {
        default:
            postfixRect.origin.x = textRect.origin.x + textRect.size.width + postfixSpace;
        } break;
    }
    
    CGFloat textYLocation = 0;
    switch (self.contentVerticalAlignment) {
        case UIControlContentVerticalAlignmentCenter:
        case UIControlContentVerticalAlignmentFill:
            textYLocation = (textRect.size.height - self.font.lineHeight)/2;
            break;
        case UIControlContentVerticalAlignmentTop:
            textYLocation = 0;
            break;
        case UIControlContentVerticalAlignmentBottom:
            textYLocation = textRect.size.height - self.font.lineHeight;
            break;
    }
    
    switch (self.postfixAlignment) {
        case RDPostfixVerticalAlignmentTop: {
            CGFloat textCapLineYLocation = textRect.origin.y + textYLocation + self.font.ascender - self.font.capHeight;
            CGFloat postfixCapLineYLocation = (postfixRect.size.height - postfixFont.lineHeight) + postfixFont.ascender - postfixFont.capHeight;//coordinates on label
            postfixRect.origin.y = textCapLineYLocation - postfixCapLineYLocation;
        } break;
        case RDPostfixVerticalAlignmentCenter: {
            postfixRect.origin.y = textRect.origin.y + textYLocation + (textRect.size.height - postfixRect.size.height)/2;
        } break;
        case RDPostfixVerticalAlignmentBottom: {
            CGFloat textBaseLineYLocation = textRect.origin.y + textYLocation + self.font.ascender;
            CGFloat postfixBaseLineYLocation = (postfixRect.size.height - postfixFont.lineHeight)/2 + postfixFont.ascender;//coordinates on label
            postfixRect.origin.y = textBaseLineYLocation - postfixBaseLineYLocation;
        } break;
    }
    
    if (self.text.length > 0) {
        self.postfixLabel.frame = postfixRect;
        self.postfixLabel.hidden = NO;
        self.postfixPlaceholderLabel.hidden = YES;
    } else {
        self.postfixPlaceholderLabel.frame = postfixRect;
        self.postfixPlaceholderLabel.hidden = NO;
        self.postfixLabel.hidden = YES;
    }
}

@end
