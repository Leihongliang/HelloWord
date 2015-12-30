//
//  BaikeTableViewCell.m
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import "BaikeTableViewCell.h"
#import "UIView+Common.h"
#import <UIImageView+WebCache.h>
@implementation BaikeTableViewCell
{

    UILabel *_titleLabel;
    UIButton *_cellButton;
    UIScrollView *_picScrollView;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customViews];
    }
    
    return self;
}

- (void)customViews{

     //self.backgroundColor = [UIColor colorWithRed:231 / 255.0 green:231 / 255.0 blue:239 / 255.0 alpha:1.0];
    
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    
    _cellButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_cellButton setImage:[UIImage imageNamed:@"title_btn_back@2x" ]forState:UIControlStateNormal];
    [_cellButton addTarget:self action:@selector(jumpToDetialPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_cellButton];
    
    
    _picScrollView = [UIScrollView new];
    [self.contentView addSubview:_picScrollView];
    
    
    
    
}


- (void)jumpToDetialPage:(UIButton *)cellButton{

    NSLog(@"dainji");
}

- (void)setViewFrames{

    CGFloat leftPadding = 10;
    CGFloat topPadding = 10;
    CGFloat padding = 10;
    CGSize CellSize = self.contentView.frame.size;
    
    
    _titleLabel.frame = CGRectMake(leftPadding, topPadding,250 ,25);
    _cellButton.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) + padding, topPadding, CellSize.width -  leftPadding *2 - padding - 250, 20);
    
    CGFloat scrollViewHeight =100;
    _picScrollView.frame = CGRectMake(leftPadding, CGRectGetMaxY(_titleLabel.frame) + padding, CellSize.width, scrollViewHeight);
    NSInteger imageCount = _model.list.count;
    CGFloat scrollPadding = 10;
    CGFloat imageWidth = (CellSize.width - 4*scrollPadding )/3;
    CGFloat imageHight = scrollViewHeight - scrollPadding;
    for (int i = 0; i < imageCount;  i++) {
        UIImageView *imageView = [[UIImageView alloc ] init];
        imageView.frame = CGRectMake(((scrollPadding + imageWidth) *i + scrollPadding), scrollPadding, imageWidth, imageHight);
        ListModel *photoModel = _model.list[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:photoModel.img] placeholderImage:[UIImage imageNamed:@"topic_Cell_Bg@2x"]];
        [_picScrollView addSubview:imageView];
    }
    _picScrollView.contentSize = CGSizeMake(imageCount *(scrollPadding + imageWidth ) + scrollPadding, scrollViewHeight);
    
}

- (void)setModel:(DataModel *)model{

    _model = model;
    _titleLabel.text = _model.baikename;
    [self setViewFrames];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
