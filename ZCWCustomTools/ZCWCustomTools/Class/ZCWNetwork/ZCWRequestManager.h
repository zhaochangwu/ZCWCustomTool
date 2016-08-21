//
//  ZCWRequestManager.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/7/29.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "AFNetworking.h"

@class ZCWError;
@class ZCWPageModel;

UIKIT_EXTERN NSString *const kUrlPathPrx;

UIKIT_EXTERN NSString *const kHTTPHeaderKeyToken;
UIKIT_EXTERN NSString *const kHTTPHeaderKeyDeviceId;
UIKIT_EXTERN NSString *const kHTTPHeaderKeyEmpId;

#define kTimeoutInterval 30.0f

#define kUrlPath(path) [NSString stringWithFormat:@"%@%@", kUrlPathPrx, (path)]

@interface ZCWRequestManager : AFHTTPSessionManager

/**
 *  获取单例
 *
 */
+ (instancetype)shareInstance;

/**
 *  设置请求头
 *
 *  @param token    <#token description#>
 *  @param deviceId <#deviceId description#>
 *  @param empId    <#empId description#>
 */
- (void)setupHTTPHeader:(NSString *)token
               deviceId:(NSString *)deviceId
                  empId:(NSString *)empId;

/**
 *  清除请求头
 */
- (void)clearHTTPHeader;

@end
