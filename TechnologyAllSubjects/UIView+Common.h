//
//  UIView+Common.h
//  IFree
//
//  Created by qianfeng on 15/12/9.
//  Copyright © 2015年 雷宏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Common)

//返回屏幕的宽度 （retun 屏幕的宽度）
CGFloat screenWidth();

CGFloat screenHeight();

CGFloat maxX(UIView *view);
CGFloat maxY(UIView *view);
CGFloat minX(UIView *view);
CGFloat minY(UIView *view);
CGFloat width(UIView *view);
CGFloat height(UIView *view);
              
@end
