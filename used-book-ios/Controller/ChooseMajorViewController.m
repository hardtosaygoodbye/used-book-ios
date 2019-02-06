//
//  ChooseMajorViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/5.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "ChooseMajorViewController.h"

@interface ChooseMajorViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray<MajorModel *> *dataArray;


@end

@implementation ChooseMajorViewController

- (void)setDataArray:(NSArray<MajorModel *> *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择专业";
    
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView = tableView;
    
    [[AWAPI shareInstance] requestMajorWithComplete:^(id data, long statusCode) {
        if (kResSuccess) {
            NSNumber *code = [data valueForKey:@"code"];
            if (code.intValue == 0) {
                self.dataArray = [NSArray yy_modelArrayWithClass:[MajorModel class] json:[data valueForKey:@"majors"]];
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
    [AWAPI shareInstance].userModel.majorID = self.dataArray[indexPath.row].majorID;
    ChooseGradeViewController *vc = [[ChooseGradeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
