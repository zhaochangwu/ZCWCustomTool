//
//  UIView+ZCWExtension.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/3.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "NSObject+Nib.h"

@implementation NSObject (Nib)

+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class])
                          bundle:nil];
}

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

@end
