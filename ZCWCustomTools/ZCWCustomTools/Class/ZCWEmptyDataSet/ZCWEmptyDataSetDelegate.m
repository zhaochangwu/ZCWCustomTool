//
//  ZCWEmptyDataSetDelegate.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "ZCWEmptyDataSetDelegate.h"
#import "ZCWEmptyDataSetModel.h"

@interface ZCWEmptyDataSetDelegate ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, readonly, strong) ZCWEmptyDataSetModel *model;

@end

@implementation ZCWEmptyDataSetDelegate

- (instancetype)initWithScrollView:(UIScrollView *)scrollView {
    self = [self init];
    if (self) {
        self.scrollView = scrollView;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.type = ZCWEmptyDataSetTypeNoData;
    }
    return self;
}


- (void)setType:(ZCWEmptyDataSetType)type {
    _type = type;
    _model = [ZCWEmptyDataSetModel modelWithType:type];
    [_scrollView reloadEmptyDataSet];
}

#pragma mark - DZNEmptyDataSetSource
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.model.image;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return self.model.title;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView
                                          forState:(UIControlState)state {
    if (state == UIControlStateNormal) {
        return self.model.defaultButtonTitle;
    } else {
        return self.model.pressedButtonTitle;
    }
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView
                                         forState:(UIControlState)state {
    if (state == UIControlStateNormal) {
        return self.model.defaultButtonBackgroundImage;
    } else {
        return self.model.pressedButtonBackgroundImage;
    }
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.verticalOffset;
}

#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    if (self.buttonAction) {
        self.buttonAction();
    }
}

@end
