//
//  ZCWEmptyDataSetConstant.h
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#ifndef ZCWEmptyDataSetConstant_h
#define ZCWEmptyDataSetConstant_h

typedef NS_ENUM(NSUInteger, ZCWEmptyDataSetType) {
    ZCWEmptyDataSetTypeNoData,
    ZCWEmptyDataSetTypeLoadFailed,
    ZCWEmptyDataSetTypeNoAuthority,
};

#define kEmptyDataSetButtonColorDefault [UIColor colorWithHexString:@"#c5342a"]
#define kEmptyDataSetButtonColorPressed [UIColor colorWithHexString:@"#c5342a" alpha:0.5]
#define kEmptyDataSetTitleColor  [UIColor colorWithHexString:@"#333333"]
#define kEmptyDataSetFont   [UIFont systemFontOfSize:16]

#endif /* ZCWEmptyDataSetConstant_h */
