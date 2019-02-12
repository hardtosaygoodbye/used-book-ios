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
@property (nonatomic, weak) UIButton *codeBtn;
@property (nonatomic, weak) UIButton *startBtn;
@property (nonatomic, assign) BOOL isCountDown;
@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isCountDown = NO;
    
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
    [self.phoneTF.textField addTarget:self action:@selector(onTyping:) forControlEvents:UIControlEventEditingChanged];

    
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
    self.codeBtn = codeBtn;
    
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
    [self.codeTF.textField addTarget:self action:@selector(onTyping:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:startBtn];
    [startBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@40);
        make.top.equalTo(codeTF.bottom).offset(20);
    }];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    startBtn.backgroundColor = kGrayColor;
    [startBtn addTarget:self action:@selector(onStart:) forControlEvents:UIControlEventTouchUpInside];
    self.startBtn = startBtn;
}

- (void)onTyping:(UITextField *)textField {
    NSString *phone = self.phoneTF.textField.text;
    NSString *code = self.codeTF.textField.text;
    if (phone.length == 11 && !self.isCountDown) {
        self.codeBtn.backgroundColor = kFirstColor;
        self.codeBtn.enabled = YES;
    } else {
        self.codeBtn.backgroundColor = kGrayColor;
        self.codeBtn.enabled = NO;
    }
    if (code.length == 6 && phone.length == 11) {
        self.startBtn.enabled = YES;
        self.startBtn.backgroundColor = kFirstColor;
    } else {
        self.startBtn.enabled = NO;
        self.startBtn.backgroundColor = kGrayColor;
    }
}

- (void)onSMSCode:(UIButton *)sender {
    NSString *phone = self.phoneTF.textField.text;
    if (phone.length != 11) {
        return;
    }
    sender.enabled = NO;
    sender.backgroundColor = kGrayColor;
    [[AWAPI shareInstance] requestGetSMSCodeWithPhone:phone complete:^(id data, long statusCode) {
        if (kResSuccess) {
            [AWUI showHudTipStr:@"获取验证码成功"];
            [self.codeBtn setTitle:@"30 秒" forState:UIControlStateDisabled];
            self.isCountDown = YES;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
        } else {
            sender.enabled = YES;
            kErrToast;
        }
    }];
}

- (void)onStart:(UIButton *)sender {
    NSString *phone = self.phoneTF.textField.text;
    NSString *code = self.codeTF.textField.text;
    UserModel *userModel = [[UserModel alloc] init];
    userModel.phone = phone;
    userModel.code = code;
    [AWAPI shareInstance].userModel = userModel;
    
    [[AWAPI shareInstance] requestAuthorityWithComplete:^(id data, long statusCode) {
        if (kResSuccess) {
            NSNumber *isSignUp = [data valueForKey:@"isSignUp"];
            if (isSignUp.intValue == 1) {
                // 注册
                ChooseSchoolViewController *vc = [[ChooseSchoolViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            } else if (isSignUp.intValue == 0) {
                // 登录
                [AWUI showHudTipStr:@"登录成功"];
                [AWNetwork shareInstance].token = [data valueForKey:@"token"];
                [AWAPI shareInstance].userModel = [UserModel yy_modelWithJSON:[data valueForKey:@"user"]];
                AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [app signIn];
            } else {
                [AWUI showHudTipStr:@"程序异常"];
            }
        } else {
            kErrToast;
        }
    }];
}

- (void)countDown:(NSTimer *)timer {
    static int i = 29;
    NSString *title = [NSString stringWithFormat:@"%d 秒",i];
    [self.codeBtn setTitle:title forState:UIControlStateDisabled];
    self.codeBtn.backgroundColor = kGrayColor;
    i --;
    if (i == 0) {
        self.codeBtn.enabled = YES;
        [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        i = 29;
        self.isCountDown = NO;
        [timer invalidate];
    }
}

@end
