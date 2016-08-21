//
//  ZCWRequestManager.m
//  ZCWCustomTools
//
//  Created by zhaochangwu on 16/7/29.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import "ZCWRequestManager.h"

NSString *const kBasePath = @"https://192.168.71.26:9081/";
NSString *const kUrlPathPrx = @"ZCWCustomTools/api/mobile/";

NSString *const kHTTPHeaderKeyToken = @"token";
NSString *const kHTTPHeaderKeyDeviceId = @"deviceId";
NSString *const kHTTPHeaderKeyEmpId = @"empId";

#define kIsValidNSString(x) (x != NULL && [x length] > 0)

@implementation ZCWRequestManager

static ZCWRequestManager *_shareInstance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[ZCWRequestManager alloc] initWithBaseURL:[NSURL URLWithString:kBasePath]];
    });
    return _shareInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.securityPolicy = [self customSecurityPolicy];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
        self.requestSerializer.timeoutInterval = kTimeoutInterval;
        self.responseSerializer.acceptableContentTypes =
            [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        [self checkNetwork];
    }
    return self;
}

- (void)setupHTTPHeader:(NSString *)token
               deviceId:(NSString *)deviceId
                  empId:(NSString *)empId {
    NSLog(@"save\ntoken:%@ \ndeviceId:%@\nempId:%@", token, deviceId, empId);
    AFHTTPRequestSerializer *requestSerializer = _shareInstance.requestSerializer;
    if (kIsValidNSString(token)) {
        [requestSerializer setValue:token forHTTPHeaderField:kHTTPHeaderKeyToken];
    }
    if (kIsValidNSString(deviceId)) {
        [requestSerializer setValue:deviceId forHTTPHeaderField:kHTTPHeaderKeyDeviceId];
    }
    if (kIsValidNSString(empId)) {
        [requestSerializer setValue:empId forHTTPHeaderField:kHTTPHeaderKeyEmpId];
    }
}


- (void)clearHTTPHeader {
    AFHTTPRequestSerializer *requestSerializer = self.requestSerializer;
    [requestSerializer setValue:@"" forHTTPHeaderField:kHTTPHeaderKeyToken];
    [requestSerializer setValue:@"" forHTTPHeaderField:kHTTPHeaderKeyEmpId];
    [requestSerializer setValue:@"" forHTTPHeaderField:kHTTPHeaderKeyDeviceId];
}

- (AFSecurityPolicy *)customSecurityPolicy {
    //先导入证书，找到证书的路径
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"Admin" ofType:@"cer"];
//    NSData *certData = [NSData dataWithContentsOfFile:cerPath];

    //AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];

    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;

    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
//    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
//    securityPolicy.pinnedCertificates = set;

    return securityPolicy;
}

- (void)checkNetwork {
    [self.reachabilityManager startMonitoring];
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *statusString = nil;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                statusString = @"未知网络";
                break;
            case AFNetworkReachabilityStatusNotReachable:
                statusString = @"网络丢失";
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                statusString = @"已连上手机网络";
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                statusString = @"已连上Wifi网络";
                break;
            default:
                break;
        }
        NSLog(@"ReachabilityStatusChange %@", statusString);
    }];
}

@end
