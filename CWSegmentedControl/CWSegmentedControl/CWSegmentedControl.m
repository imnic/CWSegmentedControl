//
//  CWSegmentedControl.m
//  coldjoke-ios-client
//
//  Created by ly on 13-9-25.
//  Copyright (c) 2013年 Coldworks. All rights reserved.
//

#import "CWSegmentedControl.h"

@implementation CWSegmentedControl

- (id)initWithItems:(NSArray *)items normalImages:(NSArray *)images_n highlightImages:(NSArray *)images_h
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        NSAssert(items && images_n && images_h, @"参数不能为 nil");
        NSAssert( ([items count] == [images_n count]) && ([items count] == [images_h count]) , @"传入参数的个数应该一致");
        
        _items = items;
        _normalImages = images_n;
        _highlightImages = images_h;
        
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // 设置文字颜色
    self.textColor = [UIColor blackColor];
    self.highlightColor = [UIColor whiteColor];
    
    NSInteger count = [self.items count];
    for(NSInteger i = 0; i < count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [button setTitleColor:self.textColor forState:UIControlStateNormal];
        [button setTitleColor:self.highlightColor forState:UIControlStateHighlighted];
        [button setTitleColor:self.highlightColor forState:UIControlStateDisabled];
        button.contentMode = UIViewContentModeScaleToFill;
        [button setTitle:self.items[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButtonPressed:) forControlEvents:UIControlEventTouchDown];
        [button setBackgroundImage:self.normalImages[i] forState:UIControlStateNormal];
        [button setBackgroundImage:self.highlightImages[i] forState:UIControlStateHighlighted];
        [button setBackgroundImage:self.highlightImages[i] forState:UIControlStateDisabled];
        
        [self addSubview:button];
    }
    
    [self selectItemAtIndex:0];
}

#pragma mark - Property
- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    
    NSArray *subViews = [self subviews];
    for (UIButton *button in subViews) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
}


- (void)setHighlightColor:(UIColor *)highlightColor
{
    _highlightColor = highlightColor;
    
    NSArray *subViews = [self subviews];
    for (UIButton *button in subViews) {
        [button setTitleColor:highlightColor forState:UIControlStateNormal];
        [button setTitleColor:highlightColor forState:UIControlStateDisabled];
    }
}

#pragma mark - Layout
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self layoutMySubviews];
}

- (void)layoutMySubviews
{
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    CGFloat eachWidth = w / (CGFloat)[self.items count];
    
    NSArray *subviews = [self subviews];
    for(NSInteger i = 0; i < [subviews count]; i++)
    {
        UIButton *button = subviews[i];
        button.frame = CGRectMake(button.tag * eachWidth, 0, eachWidth, h);
    }
}

#pragma mark - Actions
- (void)onButtonPressed:(UIButton *)sender
{
    [self unselectAll];
    sender.enabled = NO;
    
    if ([self.delegate respondsToSelector:@selector(segmentedControl:didPressItemAtIndex:)]) {
        [self.delegate segmentedControl:self didPressItemAtIndex:sender.tag];
    }
}

- (void)unselectAll
{
    NSArray *subviews = [self subviews];
    for (UIButton *button in subviews) {
        button.enabled = YES;
    }
}

- (void)selectItemAtIndex:(NSUInteger)index
{
    [self unselectAll];
    
    NSArray *subviews = [self subviews];
    for (UIButton *button in subviews)
    {
        if (button.tag == index) {
            button.enabled = NO;
        }
    }
}

@end
