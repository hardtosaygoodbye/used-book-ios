//
//  HomeViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/6.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource,HomeTableViewCellDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray<HomeModel *> *dataArray;

@end

@implementation HomeViewController

- (void)setDataArray:(NSArray<HomeModel *> *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([HomeTableViewCell class])];
    tableView.rowHeight = 120;

    [[AWAPI shareInstance] requestHomeUsersWithComplete:^(id data, long statusCode) {
        if (kResSuccess) {
            NSNumber *code = [data valueForKey:@"code"];
            if (code.intValue == 0) {
                self.dataArray = [NSArray yy_modelArrayWithClass:[HomeModel class] json:[data valueForKey:@"users"]];
            }
        } else {
            kErrToast;
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTableViewCell class]) forIndexPath:indexPath];
    cell.homeModel = self.dataArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)homeTableViewCell:(HomeTableViewCell *)cell onContactInfo:(UIButton *)sender {
    NSNumber *userID = cell.homeModel.userID;
    [[AWAPI shareInstance] requestGetContactInfoWithUserID:userID complete:^(id data, long statusCode) {
        if (kResSuccess) {
            NSNumber *code = [data valueForKey:@"code"];
            if (code.intValue == 0) {
                NSString *phone = [data valueForKey:@"phone"];
                NSString *qq = [data valueForKey:@"qq"];
                NSString *wechat = [data valueForKey:@"wechat"];
                [self showContactInfoWithPhone:phone qq:qq wechat:wechat];
            }
        } else {
            kErrToast;
        }
    }];
}

- (void)showContactInfoWithPhone:(NSString *)phone qq:(NSString *)qq wechat:(NSString *)wechat {
    ContactInfoView *contactInfoView = [[ContactInfoView alloc] init];
    contactInfoView.phoneLabel.text = phone;
    contactInfoView.qqLabel.text = qq;
    contactInfoView.wechatLabel.text = wechat;
    [kWindow addSubview:contactInfoView];
}

@end
