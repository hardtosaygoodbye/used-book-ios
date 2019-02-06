//
//  ChooseGradeViewController.m
//  used-book-ios
//
//  Created by Taylor on 2019/2/6.
//  Copyright © 2019 Taylor. All rights reserved.
//

#import "ChooseGradeViewController.h"

@interface ChooseGradeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray<NSNumber *> *dataArray;

@end

@implementation ChooseGradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择你的入选年份";
    
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 2019; i > 2010; i--) {
        [tempArr addObject:[NSNumber numberWithInt:i]];
    }
    self.dataArray = tempArr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@年",self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [AWAPI shareInstance].userModel.grade = self.dataArray[indexPath.row].stringValue;
    [[AWAPI shareInstance] requestSignInWithComplete:^(id data, long statusCode) {
        if (kResSuccess) {
            NSNumber *code = [data valueForKey:@"code"];
            if (code.intValue == 0) {
                [AWUI showHudTipStr:@"注册成功"];
            }
        } else {
            kErrToast;
        }
    }];
}

@end
