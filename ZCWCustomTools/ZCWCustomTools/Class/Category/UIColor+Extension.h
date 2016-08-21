//
//  UIColor+Extension.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/6.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
//透明度固定为1，以0x开头的十六进制转换的颜色
+ (UIColor *)colorWithHex:(long)hexColor;
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha;
// iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color;
// iOS中十六进制的颜色（以#开头）转换为UIColor 透明度可调整
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(float)alpha;

//#666666
+ (UIColor *)zcw_grayColor;
//#1d1d26
+ (UIColor *)zcw_blackColor;
//#e14238
+ (UIColor *)zcw_redColor;

@end
