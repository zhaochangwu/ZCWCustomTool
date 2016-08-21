//
//  UIImage+Extension.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/5/24.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  圆形图片
 */
- (UIImage *)circleImage;

/**
 *  根据UIColor创建UIImage对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
