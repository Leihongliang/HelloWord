//
//  LeftViewController.m
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import "LeftViewController.h"
#import "LMoreModel.h"
#import "BaikeTableViewCell.h"
#import <UIImageView+WebCache.h>
#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/AFNetworking.h>
#define MOREURL @"http://www1.baike.com/api.php?m=baike_apple&a=following_baike_trends_by_baikeids&datatype=json&baikeids=107,897,66&lasttime=1450431558&count=5&page=1"
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *_tableView;
    NSMutableArray *_dataArray;
       
}


@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    self.view.backgroundColor = [UIColor orangeColor];
    [self loadDataFromNet:YES];
    [self createTableView];
}

- (void)loadDataFromNet:(BOOL)isMore{
    
    
    NSString *url = [NSString stringWithFormat:MOREURL];
    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"%@",responseObject);
        
        
        LMoreModel *model = [[LMoreModel alloc] initWithData:responseObject error:nil];
        
//        NSMutableArray *array1 =  [NSMutableArray array];
//        for (    NSMutableArray *array    in model.value.data) {
//           
//            
//           // NSLog(@"%@____________________+++++++++++++",array);
//            [array1 addObject:model.value.data];
//          }
//   
//    
//         for ( ListModel *lModel in array1[0]) {
//            
//            [_dataArray addObject:lModel];
//            NSLog(@"%@",_dataArray );
//
//            }
        
        //NSLog(@"%@",model);
        NSMutableArray *array = [[NSMutableArray alloc]init];
        [array addObject:model.value.data];
        for (ListModel *list in array[0]) {
            [_dataArray addObject:list];
        }
        
        // [_dataArray addObject:model.value.data];
        NSLog(@"%@",_dataArray);
       
        [_tableView reloadData];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      
        
    }];

}



- (void)createTableView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]  initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - 数据源及本身代理


- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DataModel *dmodel = _dataArray[indexPath.row];
    static NSString *reuseIdentifier = @"cellId";
   BaikeTableViewCell *cell  =  [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[BaikeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.model = dmodel;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 140;
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
