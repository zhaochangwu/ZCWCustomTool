//
//  ZCWPageContrller.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/10.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZCWPageModel;

typedef void(^ZCWRefreshBlock)(ZCWPageModel *model, BOOL dataStatus);

/**
 *  将分页的控制逻辑, 和数据进行封装
 */

@interface ZCWPageController : NSObject

/**
 *  默认是没有totalRecords 和totalpage的
 */
@property (nonatomic, strong) ZCWPageModel *pageModel;

/**
 *  将每次请求返回的list赋值进去, 会根据当前pageModel 判断是否加入allList
 *
 *  如果是第一页, 会先将原来的数据清除
 */
@property (nonatomic, strong) NSArray *responseList;

/**
 *  关联的UITableView
 */
@property (nonatomic, readonly, weak) UITableView *tableView;

/**
 *  所有的数据
 */
@property (nonatomic, readonly, strong) NSArray *allList;

/**
 *  实例化ZCWPageController
 *
 *  @param tableView    关联的UITableView
 *  @param headerRefreshBlock <#headerRefreshBlock description#>
 *  @param footerRefreshBlock <#footerRefreshBlock description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithTableView:(UITableView *)tableView
               headerRefreshBlock:(ZCWRefreshBlock)headerRefreshBlock
               footerRefreshBlock:(ZCWRefreshBlock)footerRefreshBlock;

/**
 *  判段是否还有更多的数据pageNum > totalpage 的时候会返回NO
 *
 *  如果没有totalRecords 和totalpage,会一直返回YES
 *
 *  @return YES 还有更多数据: NO, 没有更多数据
 */
- (BOOL)hasMoreDara;

#pragma mark - all list
/**
 *  返回index对应的allList中的对象
 *
 *  已经校验是否越界
 *
 *  @param index <#index description#>
 *
 *  @return <#return value description#>
 */
- (id)objectInAllListAtIndex:(NSUInteger)index;

/**
 *  allList中对象个数
 *
 *  @return <#return value description#>
 */
- (NSUInteger)allListCount;

#pragma mark - 刷新相关
- (void)startPullToRefresh;
- (void)startLoadMoreData;
- (void)endRefreshing;

@end
