//
//  ChooseSchoolViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/1/30.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "ChooseSchoolViewController.h"

@interface ChooseSchoolViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

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
    
    [[AWAPI shareInstance] requestSchoolsWithComplete:^(id data, long statusCode) {
        if (kResSuccess) {
            
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    return cell;
}

@end
