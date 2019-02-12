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

@synthesize userModel = _userModel;

- (void)setUserModel:(UserModel *)userModel {
    _userModel = userModel;
    NSDictionary *userDict = [userModel yy_modelToJSONObject];
    [[NSUserDefaults standardUserDefaults] setValue:userDict forKey:@"aw_user"];
}

- (UserModel *)userModel {
    if (!_userModel) {
        NSDictionary *userDict = [[NSUserDefaults standardUserDefaults] valueForKey:@"aw_user"];
        _userModel = [UserModel yy_modelWithDictionary:userDict];
    }
    return _userModel;
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

- (void)requestHomeUsersWithComplete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"book/home/" method:GET param:nil isToken:YES complete:complete];
}

- (void)requestGetContactInfoWithUserID:(NSNumber *)userID complete:(Complete)complete {
    [[AWNetwork shareInstance] requestUrl:@"user/contactInfo/" method:GET param:@{@"userID":userID} isToken:YES complete:complete];
}

@end
