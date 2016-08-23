//
//  ZCWEmptyDataSetModel.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/8/12.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "ZCWEmptyDataSetModel.h"
#import "UIColor+Extension.h"
#import "ZCWEmptyDataSetTools.h"

@interface ZCWEmptyDataSetModel ()

@property (nonatomic) CGFloat verticalOffset;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSAttributedString *title;
@property (nonatomic, strong) NSAttributedString *defaultButtonTitle;
@property (nonatomic, strong) NSAttributedString *pressedButtonTitle;
@property (nonatomic, strong) UIImage *defaultButtonBackgroundImage;
@property (nonatomic, strong) UIImage *pressedButtonBackgroundImage;

@end

@implementation ZCWEmptyDataSetModel

+ (instancetype)modelWithType:(ZCWEmptyDataSetType)type {
    ZCWEmptyDataSetModel *model = [[self alloc] init];
    switch (type) {
        case ZCWEmptyDataSetTypeNoData:
            model.image = [UIImage imageNamed:@"icon_tip01"];
            model.title = [self titleAttributedStringWithString:@"暂无数据"];
            break;
        case ZCWEmptyDataSetTypeLoadFailed:
            model.image = [UIImage imageNamed:@"icon_tip02"];
            model.title = [self titleAttributedStringWithString:@"加载失败"];
            model.defaultButtonTitle = [self attributedStringWithString:@"重新加载"
                                                                  color:kEmptyDataSetButtonColorDefault
                                                                   font:kEmptyDataSetFont];
            model.pressedButtonTitle = [self attributedStringWithString:@"重新加载"
                                                                  color:kEmptyDataSetButtonColorPressed
                                                                   font:kEmptyDataSetFont];
            model.defaultButtonBackgroundImage = [self buttonBackgroundImageWithColor:kEmptyDataSetButtonColorDefault];
            model.pressedButtonBackgroundImage = [self buttonBackgroundImageWithColor:kEmptyDataSetButtonColorPressed];
            break;
        case ZCWEmptyDataSetTypeNoAuthority:
            model.image = [UIImage imageNamed:@"img_none"];
            model.title = [self titleAttributedStringWithString:@"您无权操作此系统, 如欲申请相关权限, 请联系经济业务总部马珂"];
            break;
        default:
            break;
    }
    return model;
}

+ (UIImage *)buttonBackgroundImageWithColor:(UIColor *)color {
    CGFloat space = (ZCWScreenW - 200) / 2;
    UIEdgeInsets capInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
    UIEdgeInsets rectInsets = UIEdgeInsetsMake(-20.0, -space, -20.0, -space);
    return [[[ZCWEmptyDataSetTools borderImageWithColor:color] resizableImageWithCapInsets:capInsets
                                                             resizingMode:UIImageResizingModeStretch
             ] imageWithAlignmentRectInsets:rectInsets
            ];
}

+ (NSAttributedString *)titleAttributedStringWithString:(NSString *)string {
    return [self attributedStringWithString:string
                                      color:kEmptyDataSetTitleColor
                                       font:kEmptyDataSetFont];
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                             color:(UIColor *)color
                                              font:(UIFont *)font {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    if (color) {
        [attributes setObject:color forKey:NSForegroundColorAttributeName];
    }
    return [[NSAttributedString alloc] initWithString:string
                                           attributes:attributes];
}

@end
