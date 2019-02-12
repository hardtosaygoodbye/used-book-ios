//
//  AWNetwork.m
//  Hysteria-oc
//
//  Created by willow on 2018/7/19.
//  Copyright © 2018年 willow. All rights reserved.
//

#import "AWNetwork.h"

#define kTokenKey @"aw_token"

static AWNetwork *_instance = nil;

@implementation AWNetwork

@synthesize token = _token;

- (void)setToken:(NSString *)token {
    _token = token;
    [[NSUserDefaults standardUserDefaults] setValue:token forKey:kTokenKey];
}

- (NSString *)token {
    if (!_token) {
        _token = [[NSUserDefaults standardUserDefaults] valueForKey:kTokenKey];
    }
    return _token;
}

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[AWNetwork alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    });
    return _instance;
}

- (void)requestUrl:(NSString *)url method:(RequestMethod)method param:(NSDictionary *)param isToken:(BOOL)isToken complete:(Complete)complete {
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    [serializer setRemovesKeysWithNullValues:YES];
    self.responseSerializer = serializer;
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.requestSerializer.timeoutInterval = 5.0f;
    NSMutableDictionary *tempParam = [NSMutableDictionary dictionaryWithDictionary:param];
    if (isToken && self.token) {
//        NSString *authorization = [NSString stringWithFormat:@"Token %@", self.token];
//        [self.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
        [tempParam setValue:self.token forKey:@"token"];
    }
//    else {
//        [self.requestSerializer clearAuthorizationHeader];
//    }
    Log(@"\n===========request===========\n%@\n%@:\n%@", kNetworkMethodName[method], url, tempParam);
    switch (method) {
        case GET:
        {
            [self GET:url parameters:tempParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseWithTask:task responseObject:responseObject error:nil complete:complete];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleResponseWithTask:task responseObject:nil error:error complete:complete];
            }];
        }
            break;
        case POST:
        {
            [self POST:url parameters:tempParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseWithTask:task responseObject:responseObject error:nil complete:complete];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleResponseWithTask:task responseObject:nil error:error complete:complete];
            }];
        }
            break;
        case PUT:
        {
            [self PUT:url parameters:tempParam success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseWithTask:task responseObject:responseObject error:nil complete:complete];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleResponseWithTask:task responseObject:nil error:error complete:complete];
            }];
        }
            break;
        case PATCH:
        {
            [self PATCH:url parameters:tempParam success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseWithTask:task responseObject:responseObject error:nil complete:complete];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleResponseWithTask:task responseObject:nil error:error complete:complete];
            }];
        }
            break;
        case DELETE:
        {
            [self DELETE:url parameters:tempParam success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseWithTask:task responseObject:responseObject error:nil complete:complete];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleResponseWithTask:task responseObject:nil error:error complete:complete];
            }];
        }
        default:
            break;
    }
}

- (void)handleResponseWithTask:(NSURLSessionDataTask *)task responseObject:(id)responseObject error:(NSError *)error complete:(Complete)complete {
    long statusCode = ((NSHTTPURLResponse *)task.response).statusCode;
    if (error) {
        NSData *errData = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
        NSDictionary *errDict = @{@"detail":@"请检查网络连接"};
        if (errData) {
            errDict = [NSJSONSerialization JSONObjectWithData:errData options:kNilOptions error:nil];
        }
        complete(errDict,statusCode);
        NSLog(@"| failure: %@",errDict);
        Log(@"\n===========response===========\n%@\n%ld", errDict, statusCode);
    } else {
        complete(responseObject,statusCode);
        Log(@"\n===========response===========\n%@\n%ld", responseObject, statusCode);
    }
}

@end
