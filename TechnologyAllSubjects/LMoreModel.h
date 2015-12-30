//
//  LMoreModel.h
//  TechnologyAllSubjects
//
//  Created by qianfeng on 15/12/18.
//  Copyright © 2015年 CoffeeTaie. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol ListModel

@end

@interface ListModel : JSONModel
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString  *summary;
@property (nonatomic,copy) NSString  *listid;
@property (nonatomic,copy) NSString  <Optional>*img;

@end




@protocol  DataModel
@end

@interface  DataModel: JSONModel

@property (nonatomic,copy) NSString  <Optional>*baikeid;
@property (nonatomic,copy) NSString  <Optional>*baikename;
@property (nonatomic,copy) NSString  <Optional>*answer_total;

@property (nonatomic,strong) NSMutableArray <ListModel> *list;
@end

@interface  valueModel: JSONModel

@property (nonatomic,copy) NSString  *total;
@property (nonatomic,strong) NSMutableArray <DataModel> *data;
@end

@interface LMoreModel : JSONModel

@property (nonatomic,strong) valueModel  *value;
@end
