//
//  BookModel.h
//  used-book-ios
//
//  Created by Taylor on 2019/2/10.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookModel : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *isbn;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *originalPrice;

@property (nonatomic, copy) NSString *publisher;

@end

NS_ASSUME_NONNULL_END
