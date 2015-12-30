//
//  HeadModel.h
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
////http://www1.baike.com/api.php?datatype=json&m=article&a=new&baike_id=34908&start=0&limit=10

#import <JSONModel/JSONModel.h>





@protocol articleModel <NSObject>
@end

@interface articleModel : JSONModel

@property (nonatomic,copy) NSString  *artid;
@property (nonatomic,copy) NSString  *category_id;
@property (nonatomic,copy) NSString  *baike_id;
@property (nonatomic,copy) NSString  *title;

@property (nonatomic,copy) NSString  *summary;
@property (nonatomic,copy) NSString  *create_user;
@property (nonatomic,copy) NSString  *create_user_id;
@property (nonatomic,copy) NSString  *create_date;

@property (nonatomic,copy) NSString  *last_update_user;
@property (nonatomic,copy) NSString  *last_update_user_id;
@property (nonatomic,copy) NSString  *edition_count;
@property (nonatomic,copy) NSString  *support_count;

@property (nonatomic,copy) NSString  *image_url;
@property (nonatomic,copy) NSString  *reference;
@property (nonatomic,copy) NSString  *original;
@property (nonatomic,copy) NSString  *status;
@property (nonatomic,copy) NSString  *excellent;

@property (nonatomic,copy) NSString  <Optional>*commment;
@property (nonatomic,copy) NSString  *set_excellent_date;
@property (nonatomic,copy) NSString  *digest;
@property (nonatomic,copy) NSString  *views;


@end


@interface ValueModel : JSONModel

@property (nonatomic,copy) NSString  *count;
@property (nonatomic,strong) NSMutableArray <articleModel>*articlelist;

@end

@interface HeadModel : JSONModel
@property (nonatomic,copy) NSString  *msg;
@property (nonatomic,copy) NSString  <Optional>*forward;
@property (nonatomic,strong) ValueModel *value;

@end
