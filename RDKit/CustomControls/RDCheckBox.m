//
//  RDCheckBox.m
//  RDKit
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDCheckBox.h"

@interface RDCheckBox ()

- (void)initialize;

@end


@implementation RDCheckBox

#pragma mark - setters/getters
- (void)setOn:(BOOL)on
{
    _on = on;
    [self setNeedsDisplay];
}

- (void)setCheckmarkImage:(UIImage *)checkmarkImage
{
    _checkmarkImage = checkmarkImage;
    [self setNeedsDisplay];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];
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
    self.backgroundColor = [UIColor  clearColor];
}

#pragma mark - drawing
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat alpha = self.selected ? 0.7 : 1.0;
    alpha = self.enabled ? alpha : 0.5;
    
    [self.backgroundImage drawInRect:self.bounds blendMode:kCGBlendModeNormal alpha:alpha];
    
    if (self.on) {
        CGPoint point = CGPointMake(roundf((self.bounds.size.width - self.checkmarkImage.size.width)/2),
                                    roundf((self.bounds.size.height-self.checkmarkImage.size.height)/2));
        [self.checkmarkImage drawAtPoint:point blendMode:0 alpha:alpha];
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

