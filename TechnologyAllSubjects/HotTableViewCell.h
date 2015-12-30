//
//  HotTableViewCell.h
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadModel.h"
@interface HotTableViewCell : UITableViewCell

@property (nonatomic,strong) articleModel *model;
@property (nonatomic,assign,readonly ) CGFloat viewHeight;//视图高
- (void)setModel:(articleModel *)model;

@end
