//
//  ZCWPageContrller.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/10.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "ZCWPageController.h"
#import "ZCWPageModel.h"
#import "MJRefresh.h"

@interface ZCWPageController ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *allList;

@end

@implementation ZCWPageController

- (instancetype)initWithTableView:(UITableView *)tableView
               headerRefreshBlock:(ZCWRefreshBlock)headerRefreshBlock
               footerRefreshBlock:(ZCWRefreshBlock)footerRefreshBlock{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.allList = [NSMutableArray array];
        __weak __typeof__ (self) weakSelf = self;
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            __strong __typeof__ (weakSelf) strongSelf = weakSelf;
            strongSelf.pageModel.pageNum = kOriginPage;
            if (headerRefreshBlock) {
                headerRefreshBlock([strongSelf.pageModel copy], [strongSelf hasMoreDara]);
            }
        }];
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            __strong __typeof__ (weakSelf) strongSelf = weakSelf;
            if ([strongSelf hasMoreDara]) {
                strongSelf.pageModel.pageNum++;
            }
            if (footerRefreshBlock) {
                footerRefreshBlock([strongSelf.pageModel copy], [strongSelf hasMoreDara]);
            }
        }];
        self.tableView.mj_footer.hidden = YES;
    }
    return self;
}

- (void)setResponseList:(NSArray *)responseList {
    _responseList = responseList;
    if (self.pageModel.pageNum == kOriginPage) {
        //如果是第一页, 会将原来的数据清除
        [_allList removeAllObjects];
    }
    [_allList addObjectsFromArray:responseList];

}

- (ZCWPageModel *)pageModel {
    if (!_pageModel) {
        _pageModel = [[ZCWPageModel alloc] init];
        _pageModel.pageNum = kOriginPage;
        _pageModel.pageSize = kDefaultPageSize;
        _pageModel.totalRecords = kUnkownTotalRecords;
        _pageModel.totalPages = kUnkownTotalPage;
    }
    return _pageModel;
}

#pragma mark - all list

- (id)objectInAllListAtIndex:(NSUInteger)index {
    if (index < self.allList.count) {
        return  [self.allList objectAtIndex:index];
    } else {
        NSLog(@"ZCWPageController- objectInAllListAtIndex : 下标越界");
        return nil;
    }
}

- (NSUInteger)allListCount {
    return self.allList.count;
}

#pragma mark - 刷新相关
- (void)startPullToRefresh {
    [self.tableView.mj_header beginRefreshing];
}

- (void)startLoadMoreData {
    [self.tableView.mj_footer beginRefreshing];
}

- (void)endRefreshing {
    self.tableView.mj_footer.hidden = self.allListCount == 0;
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

- (BOOL)hasMoreDara {
    if (self.pageModel.totalPages == kUnkownTotalPage
        || self.pageModel.totalRecords == kUnkownTotalRecords) {
        return YES;
    }

    if (self.pageModel.pageNum > self.pageModel.totalPages) {
        return NO;
    } else {
        return YES;
    }
}

@end
