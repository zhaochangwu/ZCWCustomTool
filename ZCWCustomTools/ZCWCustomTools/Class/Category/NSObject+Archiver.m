//
//  NSObject+ZCWArchiver.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/10.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "NSObject+Archiver.h"

static NSString *const kFormat = @"/%@.json";

@implementation NSObject (ZCWArchiver)

- (BOOL)archiverWithFileName:(NSString *)fileName {
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:kFormat,fileName];
    NSLog(@"archiver file: %@ to path: \n%@", fileName, path);
    //1:准备存储数据的对象
    NSMutableData *data = [NSMutableData data];
    //2:创建归档对象
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //3:开始归档
    [archiver encodeObject:self forKey:fileName];
    //4:完成归档
    [archiver finishEncoding];
    //5:写入文件当中
    return [data writeToFile:path atomically:YES];
}

+ (instancetype)unarchiverWithFileName:(NSString *)fileName {
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:kFormat,fileName];
    //1:读取文件,生成NSData类型
    NSData *unarchiverData = [NSData dataWithContentsOfFile:path];
    //2:创建反归档对象
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:unarchiverData];
    //3:反归档.根据可以访问
    return [unarchiver decodeObjectForKey:fileName];
}

@end
