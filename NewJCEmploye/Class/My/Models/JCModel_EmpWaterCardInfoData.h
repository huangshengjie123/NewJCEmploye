//
//  JCModel_EmpWaterCardInfoData.h
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_EmpWaterCardInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *mbPhone;
@property (nonatomic, strong) NSString *creater;
@property (nonatomic, assign) id owner;
@property (nonatomic, assign) id staffMbPhone;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double uowner;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) id waterCardRecords;
@property (nonatomic, strong) NSArray *waterCardItems;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) id staffName;
@property (nonatomic, strong) NSArray *customerAddresses;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
