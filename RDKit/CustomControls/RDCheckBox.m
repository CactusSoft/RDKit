//
//  RDCheckBox.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDCheckBox.h"

static const CGFloat inset = 4.0f;

@interface RDCheckBox ()
{
    UILabel* _label;
    CGRect   _boxFrame;
}

- (void)initialize;

@end


@implementation RDCheckBox

#pragma mark - setters/getters
- (void)setTitle:(NSString*)title
{
    _label.text = title;
    [self setNeedsLayout];
}

- (NSString*)title
{
    return _label.text;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _label.textColor = titleColor;
}

- (UIColor*)titleColor
{
    return _label.textColor;
}

- (void)setTitleFont:(UIFont*)titleFont
{
    _label.font = titleFont;
    [self setNeedsLayout];
}

- (UIFont*)titleFont
{
    return _label.font;
}

- (void)setOn:(BOOL)on
{
    _on = on;
    [self setNeedsLayout];
}

- (void)setCheckMarkImage:(UIImage *)checkMarkImage
{
    if (checkMarkImage != _checkMarkImage) {
        _checkMarkImage = checkMarkImage;
        [self setNeedsLayout];
    }
}

- (void)setAlignment:(RDCheckBoxAlignment)alignment
{
    _alignment = alignment;
    [self setNeedsLayout];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    _label.highlighted = selected;
    [self setNeedsLayout];
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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
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

- (void)initialize
{
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    
    _label = [[UILabel alloc] init];
    _label.numberOfLines = 0;
    _label.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    switch (self.alignment) {
        case RDCheckBoxAlignmentRight: {
            _label.textAlignment = UITextAlignmentRight;
        } break;
        case RDCheckBoxAlignmentLeft: {
            _label.textAlignment = UITextAlignmentLeft;
        } break;
    }
    
    _boxFrame.size = self.backgroundImage.size;
    
    CGRect lableFrame = self.bounds;
    lableFrame.size.width -= _boxFrame.size.width + inset;
    lableFrame.size = [_label sizeThatFits:lableFrame.size];
    
//    CGFloat height = lableFrame.size.height > _boxFrame.size.height ? lableFrame.size.height : _boxFrame.size.height;
//    lableFrame.origin.y = (height - lableFrame.size.height)/2;
//    _boxFrame.origin.y = (height - _boxFrame.size.height)/2;
    lableFrame.origin.y = 0.0f;
    _boxFrame.origin.y = 0.0f;
    
    switch (self.alignment) {
        case RDCheckBoxAlignmentRight: {
            lableFrame.origin.x = 0;
            _boxFrame.origin.x = lableFrame.origin.x + lableFrame.size.width + inset;
        } break;
        case RDCheckBoxAlignmentLeft: {
            _boxFrame.origin.x = 0;
            lableFrame.origin.x = _boxFrame.origin.x + _boxFrame.size.width + inset;
        } break;
    }
    
    _label.frame = lableFrame;
    
    [self setNeedsDisplay];
}

#pragma mark - drawing
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat alpha = self.selected ? 0.7 : 1.0;
    alpha = self.enabled ? alpha : 0.5;
    
    _label.enabled = self.enabled;
    [_label drawTextInRect:_label.frame];
    
    [self.backgroundImage drawInRect:_boxFrame blendMode:kCGBlendModeNormal alpha:alpha];
    
    if (self.on) {
        CGPoint point = CGPointMake(_boxFrame.origin.x + (self.backgroundImage.size.width-self.checkMarkImage.size.width)/2,
                                    _boxFrame.origin.y + (self.backgroundImage.size.height-self.checkMarkImage.size.height)/2);
        [self.checkMarkImage drawAtPoint:point blendMode:0 alpha:alpha];
    }
}

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.selected = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    if ([self pointInside:[touch locationInView:self] withEvent:event]) {
        self.on = !self.on;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    self.selected = NO;
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.selected = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    if ([self pointInside:[touch locationInView:self] withEvent:event] && !self.selected) {
        self.selected = YES;
    } else if (![self pointInside:[touch locationInView:self] withEvent:event]) {
        self.selected = NO;
    }
}

@end

