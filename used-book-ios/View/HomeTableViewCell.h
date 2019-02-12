//
//  HomeTableViewCell.h
//  used-book-ios
//
//  Created by Taylor on 2019/2/8.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HomeTableViewCell;

@protocol HomeTableViewCellDelegate <NSObject>

- (void)homeTableViewCell:(HomeTableViewCell *)cell onContactInfo:(UIButton *)sender;

@end


@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) id<HomeTableViewCellDelegate> delegate;

@property (nonatomic, strong) HomeModel *homeModel;

@end

NS_ASSUME_NONNULL_END
