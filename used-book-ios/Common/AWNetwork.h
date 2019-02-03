//
//  AWNetwork.h
//  Hysteria-oc
//
//  Created by willow on 2018/7/19.
//  Copyright © 2018年 willow. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^Complete)(id data,long statusCode);

#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Patch",@"Delete"]

typedef NS_ENUM(NSInteger,RequestMethod){
    GET = 0,
    POST,
    PUT,
    PATCH,
    DELETE
};

@interface AWNetwork : AFHTTPSessionManager

@property (nonatomic, copy) NSString *token;

+ (instancetype)shareInstance;

- (void)requestUrl:(NSString *)url method:(RequestMethod)method param:(NSDictionary *)param isToken:(BOOL)isToken complete:(Complete)complete;

@end
