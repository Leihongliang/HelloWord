//
//  TabBarViewController.m
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import "TabBarViewController.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#define  AXBURL @"http://www1.baike.com/api.php?datatype=json&m=article&a=new&baike_id=34908&start=%ld&limit=10"
#import <AFNetworking/AFNetworking.h>
#import "HeadModel.h"
#import "HotTableViewCell.h"
#import <MJRefresh/MJRefresh.h>
#import "HotDetailViewController.h"
@interface TabBarViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView *_tableView;
    NSMutableArray *_dataArray;
    
}

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    _dataArray = [[NSMutableArray alloc] init];
    [self  createOpenButton];
    [self createTableView];
   // [self loadFromNet];
}
- (void)loadDataFromNet:(BOOL)isMore{
    
    NSInteger page = 0;
    if (isMore) {
        if (_dataArray.count%10 == 0) {
            page = _dataArray.count/10;
        }else{
            
            [_tableView.mj_footer endRefreshing];
            return;
        }
    }
    
    NSString *url = [NSString stringWithFormat:AXBURL,page];
    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       // NSLog(@"%@",responseObject);
        
        if (!isMore) {
            [_dataArray removeAllObjects];
            [_tableView reloadData];
        }

        HeadModel *model = [[HeadModel alloc] initWithData:responseObject error:nil];
        for (articleModel *aModel in model.value.articlelist) {
            [_dataArray addObject:aModel];
        }
        [_tableView reloadData];
        
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        isMore ? [_tableView.mj_footer endRefreshing] :[_tableView.mj_header endRefreshing];
        
    }];
}


- (void)createTableView{
    
    
    _tableView = [[UITableView alloc]  initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
     //隐藏下面的线
   // _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // NSLog(@"下拉刷新");
        [self loadDataFromNet:NO];
    }];
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // NSLog(@"加载更多");
        [self loadDataFromNet:YES];
        
    }];
    
    
    _tableView.mj_footer = footer;
    [_tableView.mj_footer beginRefreshing];
    
}

#pragma mark - 数据源及本身代理


- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIdentifier = @"cellId";
    HotTableViewCell  *cell  =  [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[HotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
      //设置选中风格
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    articleModel * amodel = _dataArray[indexPath.row];

    cell.model = amodel;
   
    return cell;
}




- (void)createOpenButton{

    
    self.navigationItem.title = @"热门文章";
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"open" style:UIBarButtonItemStylePlain target:self action:@selector(openLeftSide:)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"我点" style:UIBarButtonItemStylePlain  target:self action:@selector(openRightSide:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    

}
- (void)openLeftSide:(UIBarButtonItem  *)barButtonItem {

    [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
    }];
}


- (void)openRightSide:(UIBarButtonItem *)barButtonItem{
    
    [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - 本身代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//TODO:详情页面
    HotDetailViewController *hotDetail = [[HotDetailViewController alloc] init];
    articleModel *artModel = _dataArray[indexPath.row];
    hotDetail.detialId = artModel.artid;
    [self.navigationController pushViewController:hotDetail animated:YES];
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 130;
}


- (void)createNavigationController{

    
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
