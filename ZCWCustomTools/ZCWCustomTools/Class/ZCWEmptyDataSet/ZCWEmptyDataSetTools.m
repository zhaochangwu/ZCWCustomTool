//
//  ZCWEmptyDataSetTools.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "ZCWEmptyDataSetTools.h"
#import "ZCWEmptyDataSetConstant.h"

@implementation ZCWEmptyDataSetTools

+ (UIImage *)borderImageWithColor:(UIColor *)color {
    CGFloat width = 30;
    CGFloat height = 30;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0);
    CGFloat radius = 7;

    // 获取CGContext，注意UIKit里用的是一个专门的函数
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 移动到初始点
    CGContextMoveToPoint(context, radius, 0);

    // 绘制第1条线和第1个1/4圆弧
    CGContextAddLineToPoint(context, width - radius, 0);
    CGContextAddArc(context, width - radius, radius, radius, -0.5 * M_PI, 0.0, 0);

    // 绘制第2条线和第2个1/4圆弧
    CGContextAddLineToPoint(context, width, height - radius);
    CGContextAddArc(context, width - radius, height - radius, radius, 0.0, 0.5 * M_PI, 0);

    // 绘制第3条线和第3个1/4圆弧
    CGContextAddLineToPoint(context, radius, height);
    CGContextAddArc(context, radius, height - radius, radius, 0.5 * M_PI, M_PI, 0);

    // 绘制第4条线和第4个1/4圆弧
    CGContextAddLineToPoint(context, 0, radius);
    CGContextAddArc(context, radius, radius, radius, M_PI, 1.5 * M_PI, 0);

    // 闭合路径
    CGContextClosePath(context);

    // 填充颜色
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);

    // 设置边框宽度(线宽)
    CGContextSetLineWidth(context, 1.0f);

    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    UIImagePNGRepresentation(image);
    return image;
}

@end
