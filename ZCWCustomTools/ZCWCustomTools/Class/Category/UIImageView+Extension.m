//
//  UIImageView+Extension.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/5/24.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "UIImageView+Extension.h"
#import "UIImage+Extension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (Extension)
- (void)setHeader:(NSString *)url {
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}
@end
