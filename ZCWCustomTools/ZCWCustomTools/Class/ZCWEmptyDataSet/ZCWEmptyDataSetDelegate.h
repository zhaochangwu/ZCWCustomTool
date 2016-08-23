//
//  ZCWEmptyDataSetDelegate.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+EmptyDataSet.h"
#import "ZCWEmptyDataSetConstant.h"

typedef void(^ZCWEmptyDataSetDelegateBlock)();

@interface ZCWEmptyDataSetDelegate : NSObject <DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

- (instancetype)initWithScrollView:(UIScrollView *)scrollView;

@property (nonatomic, readonly, weak) UIScrollView *scrollView;
@property (nonatomic, readwrite, copy) ZCWEmptyDataSetDelegateBlock buttonAction;
@property (nonatomic, readwrite) CGFloat verticalOffset;

/**
 *  显示的图样式,
 */
@property (nonatomic, readwrite) ZCWEmptyDataSetType type;

@end
