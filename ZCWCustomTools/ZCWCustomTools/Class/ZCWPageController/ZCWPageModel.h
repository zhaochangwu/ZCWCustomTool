//
//  ZCWPageModel.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/7/29.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "JSONModel.h"

#define kDefaultPageSize 10
#define kOriginPage 1
#define kUnkownTotalPage -100
#define kUnkownTotalRecords -101

static NSString *kPageModelKeyTotalPage = @"totalPage";
static NSString *kPageModelKeyTotalRecords = @"TotalRecords";

/**
 *  用于控制分页
 */

@interface ZCWPageModel : JSONModel <NSCopying>

/**
 *  每页最大记录数(返回请求都需要)
 */
@property (nonatomic) int pageSize;

/**
 *  页数
 */
@property (nonatomic) int pageNum;

/**
 *  总页数
 */
@property (nonatomic) int totalPages;

/**
 *  总记录条数
 */
@property (nonatomic) int totalRecords;

#pragma mark - 拼接参数

/**
 *  将请求需要的其他对象和分页的参数合并
 *
 *  @param model 发起请求需要的其他对象
 *
 *  @return 一个请求需要的所有参数
 */
- (NSDictionary *)requestParametersWithModel:(JSONModel *)model;

/**
 *  将请求需要的其他参数和分页的参数合并
 *
 *  @param dict 发起请求需要的其他参数
 *
 *  @return 一个请求需要的所有参数
 */
- (NSDictionary *)requestParametersWithDictionary:(NSDictionary *)dict;
//
//- (void)setCurrentPage:(int)currentPage;
//- (int)currentPage;

@end
