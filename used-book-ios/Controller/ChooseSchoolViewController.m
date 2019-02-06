//
//  ChooseSchoolViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/1/30.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "ChooseSchoolViewController.h"

@interface ChooseSchoolViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<SchoolModel *> *dataArray;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation ChooseSchoolViewController

- (void)setDataArray:(NSArray<SchoolModel *> *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

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
    self.tableView = tableView;
    
    [[AWAPI shareInstance] requestSchoolsWithComplete:^(id data, long statusCode) {
        if (kResSuccess) {
            NSNumber *code = [data valueForKey:@"code"];
            if (code.intValue == 0) {
                self.dataArray = [NSArray yy_modelArrayWithClass:[SchoolModel class] json:[data valueForKey:@"schools"]];
            }
        } else {
            
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row].name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSNumber *schoolID = self.dataArray[indexPath.row].schoolID;
    [AWAPI shareInstance].userModel.schoolID = schoolID;
    ChooseMajorViewController *vc = [[ChooseMajorViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
