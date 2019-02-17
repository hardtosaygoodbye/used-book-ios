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

@property (nonatomic, weak) UILabel *phoneTitleLabel;

@property (nonatomic, weak) UILabel *qqTitleLabel;

@property (nonatomic, weak) UILabel *wechatTitleLabel;


@end

@implementation ContactInfoView

- (instancetype)init {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        UIView *bgView = [[UIView alloc] init];
        [self addSubview:bgView];
        self.bgView = bgView;
        bgView.backgroundColor = kRGBAColor(0, 0, 0, 0.3);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBG:)];
        [bgView addGestureRecognizer:tap];
        
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
        
        UILabel *phoneTitleLabel = [[UILabel alloc] init];
        [whiteView addSubview:phoneTitleLabel];
        self.phoneTitleLabel = phoneTitleLabel;
        phoneTitleLabel.text = @"手机号:";
        
        UILabel *phoneLabel = [[UILabel alloc] init];
        [whiteView addSubview:phoneLabel];
        self.phoneLabel = phoneLabel;
        
        UILabel *qqTitleLabel = [[UILabel alloc] init];
        [whiteView addSubview:qqTitleLabel];
        self.qqTitleLabel = qqTitleLabel;
        qqTitleLabel.text = @"qq号:";
        
        UILabel *qqLabel = [[UILabel alloc] init];
        [whiteView addSubview:qqLabel];
        self.qqLabel = qqLabel;
        
        UILabel *wechatTitleLabel = [[UILabel alloc] init];
        [whiteView addSubview:wechatTitleLabel];
        self.wechatTitleLabel = wechatTitleLabel;
        wechatTitleLabel.text = @"微信号:";
        
        UILabel *wechatLabel = [[UILabel alloc] init];
        [whiteView addSubview:wechatLabel];
        self.wechatLabel = wechatLabel;
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
    
    [self.phoneTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(30);
        make.left.equalTo(self.whiteView).offset(10);
    }];
    
    [self.phoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneTitleLabel.right).offset(10);
        make.centerY.equalTo(self.phoneTitleLabel);
    }];
    
    [self.qqTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTitleLabel.bottom).offset(20);
        make.left.equalTo(self.whiteView).offset(10);
    }];
    
    [self.qqLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.qqTitleLabel.right).offset(10);
        make.centerY.equalTo(self.qqTitleLabel);
    }];
    
    [self.wechatTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.whiteView).offset(10);
        make.top.equalTo(self.qqTitleLabel.bottom).offset(20);
    }];
    
    [self.wechatLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wechatTitleLabel.right).offset(10);
        make.centerY.equalTo(self.wechatTitleLabel);
    }];
}

- (void)onTapBG:(UITapGestureRecognizer *)tap {
    [self removeFromSuperview];
}

@end
