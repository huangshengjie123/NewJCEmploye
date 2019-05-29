//
//  JCModel_AllOutInputOrderInOutOrder.h
//
//  Created by   on 2018/6/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_AllOutInputOrderInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *inOutOrderIdentifier;
@property (nonatomic, assign) id comments;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id checker;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, assign) id endTime;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) double storeHouse;
@property (nonatomic, assign) double applicant;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
