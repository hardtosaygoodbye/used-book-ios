//
//  HomeModel.h
//  used-book-ios
//
//  Created by Taylor on 2019/2/10.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeModel : NSObject

@property (nonatomic, strong) NSNumber *userID;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, strong) NSArray<BookModel *> *books;

@property (nonatomic, copy) NSString *schoolName;

@property (nonatomic, copy) NSString *majorName;

@end

NS_ASSUME_NONNULL_END
