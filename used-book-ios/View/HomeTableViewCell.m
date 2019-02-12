//
//  HomeTableViewCell.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/8.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell ()

@property (nonatomic, weak) UIImageView *avatarImgView;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UILabel *descLabel;

@property (nonatomic, weak) UILabel *bookLabel;

@end

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.backgroundColor = kLightGrayColor;
        UIImageView *avatarImgView = [[UIImageView alloc] init];
        [self addSubview:avatarImgView];
        [avatarImgView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@40);
            make.height.equalTo(@40);
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
        }];
        avatarImgView.image = [UIImage imageNamed:@"test.jpg"];
        avatarImgView.layer.cornerRadius = 20;
        avatarImgView.layer.masksToBounds = YES;
        self.avatarImgView = avatarImgView;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self addSubview:titleLabel];
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(avatarImgView.centerY);
            make.left.equalTo(avatarImgView.right).offset(10);
        }];
        titleLabel.text = @"学姐有书用户";
        titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel = titleLabel;
        
        UILabel *descLabel = [[UILabel alloc] init];
        [self addSubview:descLabel];
        [descLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(avatarImgView.right).offset(10);
            make.bottom.equalTo(avatarImgView.bottom);
        }];
        descLabel.text = @"XXXXXX大学XXXXX届电子电气学院";
        descLabel.font = [UIFont systemFontOfSize:12];
        descLabel.textColor = kRGBAColor(0, 0, 0, 0.8);
        self.descLabel = descLabel;
        
        UILabel *bookLabel = [[UILabel alloc] init];
        [self addSubview:bookLabel];
        [bookLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(avatarImgView.bottom).offset(10);
        }];
        bookLabel.text = @"XXXXXX,XXXXXXX，正在出售";
        bookLabel.numberOfLines = 0;
        bookLabel.font = [UIFont systemFontOfSize:14];
        self.bookLabel = bookLabel;
        
        UIButton *contactInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:contactInfoBtn];
        [contactInfoBtn makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@30);
            make.width.equalTo(@60);
            make.top.equalTo(bookLabel.bottom).offset(10);
            make.right.equalTo(self).offset(-10);
        }];
        [contactInfoBtn setTitle:@"联系" forState:UIControlStateNormal];
        contactInfoBtn.backgroundColor = kFirstColor;
        contactInfoBtn.layer.cornerRadius = 5;
        contactInfoBtn.layer.masksToBounds = YES;
        contactInfoBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [contactInfoBtn addTarget:self action:@selector(onContactInfo:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)onContactInfo:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate homeTableViewCell:self onContactInfo:sender];
    }
}


- (void)setHomeModel:(HomeModel *)homeModel {
    _homeModel = homeModel;
    
    NSMutableString *tempBookNames = [NSMutableString string];
    for (BookModel *book in homeModel.books) {
        [tempBookNames appendString:book.name];
        [tempBookNames appendString:@","];
    }
    [tempBookNames appendString:@"正在出售"];
    self.bookLabel.text = tempBookNames;
    
    self.descLabel.text = [NSString stringWithFormat:@"本校%@届%@",homeModel.grade,homeModel.majorName];
}

@end
