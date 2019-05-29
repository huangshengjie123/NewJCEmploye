//
//  JCModel_CooperationPoiontOrderList.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_CooperationPoiontOrderGuider, JCModel_CooperationPoiontOrderCooPointSimp;

@interface JCModel_CooperationPoiontOrderList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) double guide;
@property (nonatomic, assign) id processId;
@property (nonatomic, assign) id leader;
@property (nonatomic, assign) double hasOut;
@property (nonatomic, strong) JCModel_CooperationPoiontOrderGuider *guider;
@property (nonatomic, assign) double cooId;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) JCModel_CooperationPoiontOrderCooPointSimp *cooPointSimp;
@property (nonatomic, strong) NSArray *cooPointOrderCosts;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
