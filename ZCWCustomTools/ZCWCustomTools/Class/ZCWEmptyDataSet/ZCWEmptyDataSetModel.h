//
//  ZCWEmptyDataSetModel.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCWEmptyDataSetConstant.h"

@interface ZCWEmptyDataSetModel : NSObject

+ (instancetype)modelWithType:(ZCWEmptyDataSetType)type;

//@property (nonatomic, readonly) CGFloat verticalOffset;
@property (nonatomic, readonly, strong) UIImage *image;
@property (nonatomic, readonly, strong) NSAttributedString *title;
@property (nonatomic, readonly, strong) NSAttributedString *defaultButtonTitle;
@property (nonatomic, readonly, strong) NSAttributedString *pressedButtonTitle;
@property (nonatomic, readonly, strong) UIImage *defaultButtonBackgroundImage;
@property (nonatomic, readonly, strong) UIImage *pressedButtonBackgroundImage;

@end
