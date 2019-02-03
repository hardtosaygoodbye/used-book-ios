//
//  AWTextField.m
//  used-book-ios
//
//  Created by Taylor on 2019/1/30.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "AWTextField.h"

@implementation AWTextField

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = kLightGrayColor;
        
        UILabel *hintLabel = [[UILabel alloc] init];
        [self addSubview:hintLabel];
        self.hintLabel = hintLabel;
        hintLabel.textAlignment = NSTextAlignmentCenter;
        hintLabel.font = [UIFont systemFontOfSize:14];
        
        UITextField *textField = [[UITextField alloc] init];
        [self addSubview:textField];
        self.textField = textField;
        textField.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.hintLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(@60);
    }];
    
    [self.textField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hintLabel.right);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

@end
