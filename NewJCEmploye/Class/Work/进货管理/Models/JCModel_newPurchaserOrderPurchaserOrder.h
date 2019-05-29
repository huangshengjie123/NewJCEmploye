//
//  JCModel_newPurchaserOrderPurchaserOrder.h
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_newPurchaserOrderPurchaserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id purchaserOrderIdentifier;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, assign) id leader;
@property (nonatomic, assign) id financer;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id distributer;
@property (nonatomic, assign) id createTime;
@property (nonatomic, assign) id endTime;
@property (nonatomic, assign) id applicant;
@property (nonatomic, strong) NSArray *purchaserOrderCosts;
@property (nonatomic, assign) id status;
@property (nonatomic, strong) NSString *purchaser;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
