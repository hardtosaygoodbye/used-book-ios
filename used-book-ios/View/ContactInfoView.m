//
//  ContactInfoView.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/11.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "ContactInfoView.h"

@interface ContactInfoView ()

@property (nonatomic, weak) UIView *bgView;

@property (nonatomic, weak) UIView *whiteView;

@property (nonatomic, weak) UILabel *titleLabel;


@end

@implementation ContactInfoView

- (instancetype)init {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        UIView *bgView = [[UIView alloc] init];
        [self addSubview:bgView];
        self.bgView = bgView;
        bgView.backgroundColor = kRGBAColor(0, 0, 0, 0.3);
        
        UIView *whiteView = [[UIView alloc] init];
        [self addSubview:whiteView];
        whiteView.backgroundColor = kWhiteColor;
        self.whiteView = whiteView;
        whiteView.layer.cornerRadius = 5;
        whiteView.layer.masksToBounds = YES;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        self.titleLabel.text = @"联系方式";
        
        UILabel *phoneLabel = [[UILabel alloc] init];
        [whiteView addSubview:phoneLabel];
        self.phoneLabel = phoneLabel;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.bgView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.whiteView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.height.equalTo(@400);
        make.center.equalTo(self);
    }];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.whiteView);
        make.top.equalTo(self.whiteView).offset(30);
    }];
    
    [self.phoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteView).offset(30);
        make.left.equalTo(self.whiteView).offset(10);
        make.right.equalTo(self.whiteView).offset(-10);
    }];
}

@end
