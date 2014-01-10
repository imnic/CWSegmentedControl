//
//  CWSegmentedControl.h
//  coldjoke-ios-client
//
//  Created by ly on 13-9-25.
//  Copyright (c) 2013年 Coldworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CWSegmentedControlDelegate;

@interface CWSegmentedControl : UIView
{
    NSArray *_items;
    NSArray *_normalImages;
    NSArray *_highlightImages;
}

@property (strong, nonatomic, readonly) NSArray *items;

@property (strong, nonatomic, readonly) NSArray *normalImages;

@property (strong, nonatomic, readonly) NSArray *highlightImages;

/* 正常状态下的文字颜色 */
@property (strong, nonatomic) UIColor *textColor;

/* 高亮状态下的文字颜色 */
@property (strong, nonatomic) UIColor *highlightColor;

@property (strong, nonatomic) id<CWSegmentedControlDelegate> delegate;

- (id)initWithItems:(NSArray *)items
       normalImages:(NSArray *)images_n
    highlightImages:(NSArray *)images_h;

- (void)selectItemAtIndex:(NSUInteger)index;


@end


@protocol CWSegmentedControlDelegate <NSObject>

- (void)segmentedControl:(CWSegmentedControl *)control didPressItemAtIndex:(NSUInteger)index;

@end
