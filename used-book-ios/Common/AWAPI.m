//
//  AWAPI.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/1.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "AWAPI.h"

static AWAPI *_instance = nil;

@implementation AWAPI

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[AWAPI alloc] init];
    });
    return _instance;
}

- (void)requestGetSMSCodeWithPhone:(NSString *)phone complete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"user/smsCode/" method:POST param:@{@"phone":phone} isToken:NO complete:complete];
}

- (void)requestSchoolsWithComplete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"user/schools/" method:GET param:nil isToken:NO complete:complete];
}

- (void)requestAuthorityWithComplete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"user/authority/" method:POST param:@{@"phone":self.userModel.phone, @"code":self.userModel.code} isToken:NO complete:complete];
}

- (void)requestMajorWithComplete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"user/majors/" method:GET param:@{@"schoolID": self.userModel.schoolID} isToken:NO complete:complete];
}

- (void)requestSignInWithComplete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"user/user/" method:POST param:@{@"phone":self.userModel.phone, @"code":self.userModel.code,@"schoolID":self.userModel.schoolID,@"majorID":self.userModel.majorID,@"grade":self.userModel.grade} isToken:NO complete:complete];
}

@end
