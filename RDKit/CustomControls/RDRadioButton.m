//
//  RDRadioButton.m
//  RDKit
//
//  Created by Alexey Dozortsev on 28.02.13.
//  Copyright (c) 2013 Alexey Dozortsev. All rights reserved.
//

#import "RDRadioButton.h"

static NSMutableDictionary* radioButtonGroups;

@interface RDRadioButton()

@property (nonatomic, strong) NSString* valueId;
@property (nonatomic, strong) NSString* groupId;

- (void)registerRadioButton;
- (void)unregisterRadioButton;

@end


@implementation RDRadioButton

+ (void)initialize
{
    radioButtonGroups = [[NSMutableDictionary alloc] init];
}

- (void)registerRadioButton
{
    if (self.groupId && self.valueId) {
        @synchronized(radioButtonGroups) {
            NSMutableArray* groupButtons = [radioButtonGroups objectForKey:self.groupId];
            if (groupButtons == nil) {
                groupButtons = [[NSMutableArray alloc] init];
                [radioButtonGroups setObject:groupButtons forKey:self.groupId];
            }
            NSValue* value = [NSValue valueWithPointer:(__bridge const void *)(self)];
            [groupButtons addObject:value];
        }
    }
}

- (void)unregisterRadioButton
{
    if (self.groupId && self.valueId) {
        @synchronized(radioButtonGroups) {
            NSMutableArray* groupButtons = [radioButtonGroups objectForKey:self.groupId];
            NSValue* value = [NSValue valueWithPointer:(__bridge const void *)(self)];
            for (NSValue* valueInGroup in groupButtons) {
                if ([value isEqualToValue:valueInGroup]) {
                    [groupButtons removeObject:valueInGroup];
                    break;
                }
            }
            if (groupButtons.count == 0) {
                [radioButtonGroups removeObjectForKey:self.groupId];
            }
        }
    }
}

#pragma mark - setters/getters

- (void)setOn:(BOOL)on
{
    if (on) {
        if (self.groupId && self.valueId) {
            @synchronized(radioButtonGroups) {
                NSMutableArray* groupButtons = [radioButtonGroups objectForKey:self.groupId];
                for (NSValue* valueInGroup in groupButtons) {
                    RDRadioButton* radioButton = [valueInGroup pointerValue];
                    if (radioButton != self) {
                        radioButton.on = NO;
                    }
                }
            }
        }
    }
    
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
        self.opaque = NO;
        self.backgroundColor = [UIColor  clearColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor  clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor  clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame valueId:(NSString*)valueId groudId:(NSString*)groupId
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor  clearColor];
        self.valueId = valueId;
        self.groupId = groupId;
        [self registerRadioButton];
    }
    return self;
}

- (void)dealloc
{
    [self unregisterRadioButton];
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
        if (self.on == NO) {
            self.on = YES;
        }
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
