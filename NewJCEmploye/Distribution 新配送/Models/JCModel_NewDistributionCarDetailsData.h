//
//  JCModel_NewDistributionCarDetailsData.h
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewDistributionCarDetailsCustomer, JCModel_NewDistributionCarDetailsCars;

@interface JCModel_NewDistributionCarDetailsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) id staff;
@property (nonatomic, strong) NSString *processId;
@property (nonatomic, assign) double leader;
@property (nonatomic, assign) double addrId;
@property (nonatomic, strong) JCModel_NewDistributionCarDetailsCustomer *customer;
@property (nonatomic, strong) NSString *com;
@property (nonatomic, assign) id userExtInfo;
@property (nonatomic, strong) NSString* comment;
@property (nonatomic, assign) double carId;
@property (nonatomic, assign) id tag;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) id cardId;
@property (nonatomic, strong) JCModel_NewDistributionCarDetailsCars *cars;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double cusId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
