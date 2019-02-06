//
//  UserModel.h
//  used-book-ios
//
//  Created by Taylor on 2019/2/5.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, strong) NSNumber *userID;

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, strong) NSNumber *schoolID;

@property (nonatomic, strong) NSNumber *majorID;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *code;

@end

NS_ASSUME_NONNULL_END
