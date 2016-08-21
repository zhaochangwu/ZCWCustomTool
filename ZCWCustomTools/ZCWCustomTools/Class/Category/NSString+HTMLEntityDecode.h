//
//  NSString+HTMLEntityDecode.h
//  ZCWCustomTools
//
//  Created by Yincheng on 16/5/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTMLEntityDecode)

+ (instancetype)stringByReplacingFromHtmlString:(NSString *)string;

- (NSString *)decodeURLString;

@end
