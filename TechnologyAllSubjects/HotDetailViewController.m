//
//  HotDetailViewController.m
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/16.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import "HotDetailViewController.h"
#import <WebKit/WebKit.h>
@interface HotDetailViewController ()
{
    WKWebView *_webView;
}
@end

@implementation HotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self createWebView];
    // Do any additional setup after loading the view.
}
- (void)createWebView{

    NSString *url = [NSString stringWithFormat:@"http://www1.baike.com/api.php?m=article&a=view2&baike_id=34908&article_id=%@",_detialId];
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url ]]];
}


-(void)createBackButton{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 20, 60, 44);
    button.showsTouchWhenHighlighted = YES;
    [button addTarget:self action:@selector(backTolastPage) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
}
- (void)backTolastPage {
    
    [self.navigationController popViewControllerAnimated:YES];
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
