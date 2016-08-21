//
//  ZCWPageModel.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/7/29.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "ZCWPageModel.h"

@implementation ZCWPageModel

- (id)copyWithZone:(NSZone *)zone {
    ZCWPageModel *newPage = [[ZCWPageModel alloc] init];
    newPage.pageNum = self.pageNum;
    newPage.pageSize = self.pageSize;
    newPage.totalPages = self.totalPages;
    newPage.totalRecords = self.totalRecords;
    return newPage;
}

- (NSDictionary *)requestParametersWithModel:(JSONModel *)model {
    return [self requestParametersWithDictionary:model.toDictionary];
}

-  (NSDictionary *)requestParametersWithDictionary:(NSDictionary *)dict {
    // 需要去除'totalPage'和'totalRecords'两个key,因为请求不需要
    NSDictionary *pageDict = self.toDictionary;
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
    [pageDict enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL * _Nonnull stop) {
        if (![key isEqualToString:kPageModelKeyTotalPage] && ![key isEqualToString:kPageModelKeyTotalRecords]) {
            [mutableDict setObject:obj forKey:key];
        }
    }];
    return mutableDict;
}

//- (void)setCurrentPage:(int)currentPage {
//    self.pageNum = [NSNumber numberWithInt:currentPage];
//}
//
//- (int)currentPage {
//    return self.pageNum.intValue;
//}

@end
