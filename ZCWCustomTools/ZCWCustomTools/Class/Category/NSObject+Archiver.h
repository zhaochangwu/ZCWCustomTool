//
//  NSObject+ZCWArchiver.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/10.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSArray
 */
static NSString *const kArchiverFileNameProductCategory = @"ProductCategory";

/**
 *  NSDictionary
 */
static NSString *const kArchiverFileNameRiskLevels = @"RiskLevels";

@interface NSObject (ZCWArchiver)

/**
 *  归档对象到沙盒根目录
 *
 *  @return 是否归档成功
 */
- (BOOL)archiverWithFileName:(NSString *)fileName;

/**
 *  反归档
 *
 *  @return <#return value description#>  
 */
+ (instancetype)unarchiverWithFileName:(NSString *)fileName;

@end
