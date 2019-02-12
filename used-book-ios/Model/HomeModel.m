//
//  HomeModel.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/10.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userID":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"books" : [BookModel class]};
}

@end
