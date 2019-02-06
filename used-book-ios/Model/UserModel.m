//
//  UserModel.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/5.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userID":@"id"};
}

@end
