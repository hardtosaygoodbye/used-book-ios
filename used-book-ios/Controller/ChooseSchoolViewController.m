//
//  ChooseSchoolViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/1/30.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "ChooseSchoolViewController.h"

@interface ChooseSchoolViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ChooseSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择你的学校";
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


@end
