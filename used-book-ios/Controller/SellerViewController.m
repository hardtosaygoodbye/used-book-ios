//
//  SellerViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/6.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "SellerViewController.h"

@interface SellerViewController ()

@end

@implementation SellerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:releaseBtn];
    [releaseBtn makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    releaseBtn.backgroundColor = kFirstColor;
    [releaseBtn setTitle:@"发布二手书" forState:UIControlStateNormal];
    releaseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(releaseBtn.top).offset(-20);
        make.top.equalTo(self.view);
    }];
    tableView.backgroundColor = kWhiteColor;
}

@end
