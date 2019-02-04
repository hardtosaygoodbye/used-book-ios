//
//  AWAPI.h
//  used-book-ios
//
//  Created by Taylor on 2019/2/1.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWAPI : NSObject

+ (instancetype)shareInstance;


- (void)requestGetSMSCodeWithPhone:(NSString *)phone complete:(Complete)complete;

- (void)requestSchoolsWithComplete:(Complete)complete;

@end

NS_ASSUME_NONNULL_END
