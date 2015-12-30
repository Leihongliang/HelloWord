//
//  RightViewController.m
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import "RightViewController.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
@interface RightViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_tableView;
    NSArray *_dataArray;
    NSMutableArray *_sectionName;
    
}

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor greenColor];
    [self createTableView];
}

- (void)createTableView{
    
    
    _tableView = [[UITableView alloc]  initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - 数据源及本身代理


- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIdentifier = @"cellId";
    UITableViewCell *cell  =  [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
