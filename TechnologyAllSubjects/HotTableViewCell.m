//
//  HotTableViewCell.m
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import "HotTableViewCell.h"
#import "HeadModel.h"
#import <UIImageView+WebCache.h>
@interface HotTableViewCell()

{
    UIImageView *_iconImage;
    UILabel *_title;
    UILabel *_content;
}

@end
@implementation HotTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self  customTableViewCell];
    }
    return self;
}
- (void)customTableViewCell{

    _iconImage = [UIImageView new];
  
    _title = [UILabel new];
    _title.font = [UIFont systemFontOfSize:17];
   // _title.layer.borderWidth = 0.3;
   // _title.layer.borderColor = [UIColor blackColor].CGColor;
 
    [self.contentView addSubview:_title];
    
    
    _content = [UILabel new];
    _content.numberOfLines = 3;
    _content.font = [UIFont systemFontOfSize:15];
    _content.textColor = [UIColor grayColor];
   // _content.layer.borderWidth = 0.3;
    
    [self.contentView addSubview:_content];
    
    _iconImage = [UIImageView new];
    [self.contentView addSubview:_iconImage];

    
}
- (void)setModel:(articleModel *)model{
    _model = model;
    _title.text = model.title;
    _content.text = model.summary;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    
    
}

- (void)layoutSubviews{

    [super layoutSubviews];
    CGFloat leftPadding = 10;
    CGFloat topPadding  = 10;
    CGFloat padding = 10.0;
    CGSize size =  self.contentView.frame.size;
    _title.frame = CGRectMake(leftPadding,topPadding , size.width - 2*leftPadding, 2*topPadding);
    _content.frame = CGRectMake(leftPadding, CGRectGetMaxY(_title.frame),size.width - leftPadding - 100, size.height - CGRectGetMaxY(_title.frame));
    _iconImage.frame = CGRectMake(CGRectGetMaxX(_content.frame) + padding, CGRectGetMaxY(_title.frame) + padding,100 - 2*padding , size.height - CGRectGetMaxY(_title.frame) - 2*padding );
    
    _viewHeight = CGRectGetMaxY(_content.frame) + padding;

}
- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
