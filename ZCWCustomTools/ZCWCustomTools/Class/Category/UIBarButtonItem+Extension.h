//
//  UIBarButtonItem+Extension.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/3/31.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image
               highlightImage:(NSString *)highlightImage
                       target:(id)target
                       action:(SEL)action;

@end
