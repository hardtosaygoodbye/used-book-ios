//
//  SignInViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/1/30.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()
@property (nonatomic, weak) AWTextField *phoneTF;
@property (nonatomic, weak) AWTextField *codeTF;
@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机验证";
    
    UILabel *hintLabel = [[UILabel alloc] init];
    [self.view addSubview:hintLabel];
    [hintLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(20);
    }];
    hintLabel.numberOfLines = 2;
    hintLabel.text = @"请输入您的手机号码，\n登录或注册学姐的书账号";
    hintLabel.font = kMediumFont;
    
    AWTextField *phoneTF = [[AWTextField alloc] init];
    [self.view addSubview:phoneTF];
    [phoneTF makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(hintLabel.bottom).offset(10);
    }];
    phoneTF.hintLabel.text = @"+86";
    phoneTF.textField.placeholder = @"请输入手机号";
    self.phoneTF = phoneTF;
    
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:codeBtn];
    [codeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(@100);
        make.top.equalTo(phoneTF.bottom).offset(10);
        make.right.equalTo(self.view).offset(-20);
    }];
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeBtn.backgroundColor = kGrayColor;
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [codeBtn addTarget:self action:@selector(onSMSCode:) forControlEvents:UIControlEventTouchUpInside];
    
    AWTextField *codeTF = [[AWTextField alloc] init];
    [self.view addSubview:codeTF];
    [codeTF makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(codeBtn.left).offset(-10);
        make.top.equalTo(phoneTF.bottom).offset(10);
    }];
    codeTF.hintLabel.text = @"验证码";
    codeTF.textField.placeholder = @"请输入验证码";
    self.codeTF = codeTF;
    
    UIButton *signInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:signInBtn];
    [signInBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@40);
        make.top.equalTo(codeTF.bottom).offset(20);
    }];
    [signInBtn setTitle:@"开始" forState:UIControlStateNormal];
    signInBtn.backgroundColor = kGrayColor;
    [signInBtn addTarget:self action:@selector(onStart:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onSMSCode:(UIButton *)sender {
    NSString *phone = self.phoneTF.textField.text;
    [[AWAPI shareInstance] requestGetSMSCodeWithPhone:phone complete:^(id data, long statusCode) {
        if (kResSuccess) {
             
        }
    }];
}

- (void)onStart:(UIButton *)sender {
    ChooseSchoolViewController *vc = [[ChooseSchoolViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
